import 'package:dartz/dartz.dart';
import 'package:ntgtask/core/error_handle/api_error_model.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';
import 'package:ntgtask/features/productdeatils/data/datasource/productdetails_remote_datasource.dart';

class ProductDetailsRepo {
  final ProductdetailsRemoteDatasource productdetailsRemoteDatasource;

  ProductDetailsRepo({required this.productdetailsRemoteDatasource});

  Future<Either<ApiErrorModel, ProductModel>> getProduct({
    required int id,
  }) async {
    try {
      var product = await productdetailsRemoteDatasource.getProduct(id: id);
      return Right(product);
    } on Exception catch (e) {
      return Left(ApiErrorModel(message: e.toString()));
    }
  }
}
