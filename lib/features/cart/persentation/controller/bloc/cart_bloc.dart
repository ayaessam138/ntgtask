import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ntgtask/features/cart/data/repo/cart_repo.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepo repo;

  CartBloc({required this.repo}) : super(CartInitial()) {
    Future<void> emitCartUpdate(Emitter<CartState> emit) async {
      emit(
        CartUpdated(
          cartItems: repo.cartItems,
          subtotal: repo.subtotal,
          shippingFee: repo.shippingFee,
          taxes: repo.taxes,
          total: repo.total,
        ),
      );
    }

    on<LoadCart>((event, emit) async {
      await repo.loadCart();
      await emitCartUpdate(emit);
    });

    on<AddToCartEvent>((event, emit) async {
      await repo.addToCart(event.product);
      await emitCartUpdate(emit);
    });

    on<IncrementItem>((event, emit) async {
      await repo.incrementItem(event.product);
      await emitCartUpdate(emit);
    });

    on<DecrementItem>((event, emit) async {
      await repo.decrementItem(event.product);
      await emitCartUpdate(emit);
    });

    on<RemoveFromCart>((event, emit) async {
      await repo.removeFromCart(event.product);
      await emitCartUpdate(emit);
    });

    on<ClearCart>((event, emit) async {
      await repo.clearCart();
      emit(CartUpdated(
        cartItems: [],
        subtotal: 0,
        shippingFee: repo.shippingFee,
        taxes: repo.taxes,
        total: 0,
      ));
    });
  }
}
