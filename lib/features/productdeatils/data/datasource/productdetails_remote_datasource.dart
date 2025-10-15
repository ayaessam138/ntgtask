import 'package:ntgtask/core/helpers/app_const.dart';
import 'package:ntgtask/core/network/dio_client.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

class ProductdetailsRemoteDatasource {
  final DioClient dioClient;

  ProductdetailsRemoteDatasource({required this.dioClient});

  Future<ProductModel> getProduct({required int id}) async {
    final response = await dioClient.get("${ApiConstants.productsApi}/$id");
    return ProductModel.fromJson(response.data);
  }
}
