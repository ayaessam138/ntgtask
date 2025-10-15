import 'package:ntgtask/core/helpers/app_const.dart';
import 'package:ntgtask/core/helpers/sql_helper.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

class HomeLocalDatasource {
  final SqlHelper sqlHelper;

  HomeLocalDatasource({required this.sqlHelper});

  // Products
  Future<void> cacheProducts(List<ProductModel> products) async {
    await sqlHelper.deleteAll(AppConstants.productTable);
    for (var product in products) {
      await sqlHelper.create(
        map: product.toJson(),
        tableName: AppConstants.productTable,
      );
    }
  }

  Future<List<ProductModel>> getCachedProducts() async {
    final data = await sqlHelper.read(tableName:AppConstants.productTable);
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<void> clearProductsCache() async {
    await sqlHelper.deleteAll(AppConstants.productTable);
  }

  // Categories
  Future<void> cacheCategories(List<String> categories) async {
    await sqlHelper.deleteAll(AppConstants.categoryTable);
    for (var cat in categories) {
      await sqlHelper.create(
        map: {'name': cat},
        tableName: AppConstants.categoryTable,
      );
    }
  }

  Future<List<String>> getCachedCategories() async {
    final data = await sqlHelper.read(tableName:AppConstants.categoryTable);
    return data.map((e) => e['name'] as String).toList();
  }

  Future<void> clearCategoriesCache() async {
    await sqlHelper.deleteAll(AppConstants.categoryTable);
  }
}
