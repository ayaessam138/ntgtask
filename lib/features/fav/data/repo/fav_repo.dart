import 'package:ntgtask/features/fav/data/datasource/fav_local_datasource.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';


class FavRepo {
  final FavLocalDatasource localDatasource;

  FavRepo({required this.localDatasource});

  
  Future<List<ProductModel>> getFavorites() async {
    return await localDatasource.getFavorites();
  }


  Future<void> addToFavorites(ProductModel product) async {
    await localDatasource.addToFavorites(product);
  }

  
  Future<void> removeFromFavorites(int id) async {
    await localDatasource.removeFromFavorites(id);
  }


  Future<bool> isFavorite(int id) async {
    return await localDatasource.isFavorite(id);
  }
}
