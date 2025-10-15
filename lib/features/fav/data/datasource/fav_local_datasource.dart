import 'package:ntgtask/core/helpers/app_const.dart';
import 'package:ntgtask/core/helpers/sql_helper.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';


class FavLocalDatasource {
  final SqlHelper sqlHelper;

  FavLocalDatasource({required this.sqlHelper});


  Future<void> addToFavorites(ProductModel product) async {
    await sqlHelper.create(
      tableName: AppConstants.favTable,
      map: {
        'id': product.id,
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'category': product.category,
        'image': product.image,
      },
    );
  }


  Future<List<ProductModel>> getFavorites() async {
    final result = await sqlHelper.read(tableName: AppConstants.favTable);
    return result.map((e) => ProductModel.fromJson(e)).toList();
  }


  Future<void> removeFromFavorites(int id) async {
    await sqlHelper.delete(AppConstants.favTable, id);
  }


  Future<bool> isFavorite(int id) async {
    final result = await sqlHelper.read(
      tableName: AppConstants.favTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }
}
