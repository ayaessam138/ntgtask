import 'package:ntgtask/core/helpers/app_const.dart';
import 'package:ntgtask/core/helpers/sql_helper.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

class CartLocalDatasource {
  final SqlHelper sqlHelper;

  CartLocalDatasource({required this.sqlHelper});
  Future<void> saveCartItem(ProductModel product) async {
    final existing = await sqlHelper.read(
      tableName: AppConstants.cartTable,
      where: 'id = ?',
      whereArgs: [product.id],
    );

    if (existing.isNotEmpty) {
      updateItemCount(product);
    } else {
      await sqlHelper.create(
        tableName: AppConstants.cartTable,
        map: {
          'id': product.id,
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'category': product.category,
          'image': product.image,
          'itemCount': product.itemCount,
        },
      );
    }
  }

  Future<List<ProductModel>> getCartItems() async {
    final result = await sqlHelper.read(tableName: AppConstants.cartTable);
    return result.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<void> updateItemCount(ProductModel product) async {
    final db = await sqlHelper.database;
    await db.update(
      AppConstants.cartTable,
      {'itemCount': product.itemCount},
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<void> removeCartItem(int id) async {
    await sqlHelper.delete(AppConstants.cartTable, id);
  }

  Future<void> clearCart() async {
    await sqlHelper.deleteAll(AppConstants.cartTable);
  }
}
