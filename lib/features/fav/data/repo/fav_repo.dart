import 'package:dartz/dartz.dart';
import 'package:ntgtask/core/error_handle/api_error_model.dart';
import 'package:ntgtask/features/fav/data/datasource/fav_local_datasource.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

class FavRepo {
  final FavLocalDatasource localDatasource;

  FavRepo({required this.localDatasource});

  Future<Either<ApiErrorModel, List<ProductModel>>> getFavorites() async {
    try {
      final favorites = await localDatasource.getFavorites();
      return Right(favorites);
    } catch (e) {
      return Left(ApiErrorModel(message: e.toString()));
    }
  }

  Future<Either<ApiErrorModel, void>> addToFavorites(ProductModel product) async {
    try {
      await localDatasource.addToFavorites(product);
      return const Right(null);
    } catch (e) {
      return Left(ApiErrorModel(message: e.toString()));
    }
  }

  Future<Either<ApiErrorModel, void>> removeFromFavorites(int id) async {
    try {
      await localDatasource.removeFromFavorites(id);
      return const Right(null);
    } catch (e) {
      return Left(ApiErrorModel(message: e.toString()));
    }
  }

  Future<Either<ApiErrorModel, bool>> isFavorite(int id) async {
    try {
      final fav = await localDatasource.isFavorite(id);
      return Right(fav);
    } catch (e) {
      return Left(ApiErrorModel(message: e.toString()));
    }
  }
}
