import 'package:ntgtask/core/helpers/app_const.dart';
import 'package:ntgtask/core/network/dio_client.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

class HomeRemoteDatasource {
  final DioClient dioClient;

  HomeRemoteDatasource({required this.dioClient});

  Future<List<ProductModel>> getProducts() async {
    final response = await dioClient.get(ApiConstants.productsApi);

    //Convert the list dynamic to List<Map<String, dynamic>>
    List<Map<String, dynamic>> productsList = List<Map<String, dynamic>>.from(response.data);
    final products = productsList.map((e) => ProductModel.fromJson(e)).toList();

    return products;
  }

  Future<List<String>> getCategories() async {
    final response = await dioClient.get(ApiConstants.categoriesApi);
    final categoriesList = List<String>.from(response.data);
    return categoriesList;
  }
}
