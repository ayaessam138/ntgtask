import 'package:ntgtask/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

class CartRepo {
  // Local data source responsible for saving and loading cart items from local storage (SQLite)
  final CartLocalDatasource localDatasource;

  // Default values for shipping and taxes — these are constants added to the total
  final num defaultShipping = 10;
  final num defaultTaxes = 5;

  CartRepo({required this.localDatasource});

  // Internal list to keep the current in-memory cart items
  final List<ProductModel> _cartItems = [];

  // Public getter to safely return a copy of the current cart items
  List<ProductModel> get cartItems => List.from(_cartItems);

  //  Load cart from database

  Future<void> loadCart() async {
    // Clear the in-memory list first (to avoid duplication)
    _cartItems
      ..clear()
      // Then load items from the local data source (SQLite) and add them to memory
      ..addAll(await localDatasource.getCartItems());
  }

  /// Add a product to the cart

  Future<void> addToCart(ProductModel product) async {
    // Check if the product already exists in the cart
    final index = _cartItems.indexWhere((p) => p.id == product.id);

    // If the product is new (not in cart)
    if (index == -1) {
      product.itemCount = 1; // Initialize its quantity to 1
      _cartItems.add(product); // Add it to the in-memory cart list
    } else {
      // If product already exists, just increase its quantity
      _cartItems[index].itemCount++;
    }

    // Save or update this product in the local database
    await localDatasource.saveCartItem(product);
  }

  //  Increase item quantity

  Future<void> incrementItem(ProductModel product) async {
    // Find the product in the in-memory cart
    final index = _cartItems.indexWhere((p) => p.id == product.id);

    // If it exists (index != -1 means found)
    if (index != -1) {
      _cartItems[index].itemCount++; // Increase count in memory
      // Update its quantity in local database
      await localDatasource.updateItemCount(_cartItems[index]);
    }
  }

  //  Decrease item quantity

  Future<void> decrementItem(ProductModel product) async {
    // Find the product in the cart
    final index = _cartItems.indexWhere((p) => p.id == product.id);

    // Only act if it exists
    if (index != -1) {
      // If quantity is more than 1, just decrease it
      if (_cartItems[index].itemCount > 1) {
        _cartItems[index].itemCount--;
        // Update new quantity in database
        await localDatasource.updateItemCount(_cartItems[index]);
      } else {
        // If quantity is 1, remove item from both DB and memory
        await localDatasource.removeCartItem(_cartItems[index].id!);
        _cartItems.removeAt(index);
      }
    }
  }

  //  Remove product from cart

  Future<void> removeFromCart(ProductModel product) async {
    // Remove item from local DB
    await localDatasource.removeCartItem(product.id!);
    // Remove item from memory
    _cartItems.removeWhere((p) => p.id == product.id);
  }

  // Clear the entire cart

  Future<void> clearCart() async {
    // Clear both local database and memory list
    await localDatasource.clearCart();
    _cartItems.clear();
  }



  // Calculate subtotal (sum of all items' prices × quantity)
  num get subtotal => _cartItems.fold(
    0,
    (prev, item) => prev + (item.price ?? 0) * item.itemCount,
  );

  // Calculate total = subtotal + shipping + taxes
  num get total => subtotal + defaultShipping + defaultTaxes;

  // Return default shipping and taxes values (could be dynamic later)
  num get shippingFee => defaultShipping;
  num get taxes => defaultTaxes;
}
