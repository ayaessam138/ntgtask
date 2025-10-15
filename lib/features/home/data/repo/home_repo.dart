import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ntgtask/core/error_handle/api_error_model.dart';
import 'package:ntgtask/core/error_handle/error_handler.dart';
import 'package:ntgtask/core/network/network_info.dart';
import 'package:ntgtask/features/home/data/datasource/home_%20remote_datasource.dart';
import 'package:ntgtask/features/home/data/datasource/home_local_datasource.dart';

import 'package:ntgtask/features/home/data/model/product_model.dart';

class HomeRepo {
  final HomeLocalDatasource homeLocalDatasource;
  final HomeRemoteDatasource homeRemoteDatasource;
  final NetworkInfo networkInfo;

  HomeRepo({
    required this.homeLocalDatasource,
    required this.homeRemoteDatasource,
    required this.networkInfo,
  });

  //  Get Products
  Future<Either<ApiErrorModel, List<ProductModel>>> getProducts({
    bool isRefresh = false,
  }) async {
    try {
      // If user pulls to refresh → clear cache first
      if (isRefresh) await homeLocalDatasource.clearProductsCache();

      // Try local data first
      final localData = await homeLocalDatasource.getCachedProducts();
      if (localData.isNotEmpty && !isRefresh) {
        return Right(localData);
      }

      //  Check internet before hitting API
      final hasConnection = await networkInfo.isConnected();
 
      if (!hasConnection) {
        // No internet — return cached data if available
        if (localData.isNotEmpty) {
          return Right(localData);
        }
        // Else return network error
        return Left(ApiErrorModel(message: "No Internet Connection", code: 0));
      }

      //  If online → fetch from remote
      final remoteData = await homeRemoteDatasource.getProducts();
      await homeLocalDatasource.cacheProducts(remoteData);

      return Right(remoteData);
    } catch (error) {
      final handledError = ErrorHandler.handle(error).apiErrorModel;
      return Left(handledError);
    }
  }

  //  Get Categories
  Future<Either<ApiErrorModel, List<String>>> getCategories({
    bool isRefresh = false,
  }) async {
    try {
      if (isRefresh) await homeLocalDatasource.clearCategoriesCache();

      final localData = await homeLocalDatasource.getCachedCategories();
      if (localData.isNotEmpty && !isRefresh) {
        return Right(localData);
      }

      final hasConnection = await networkInfo.isConnected();

      if (!hasConnection) {
        if (localData.isNotEmpty) {
          return Right(localData);
        }
        return Left(ApiErrorModel(message: "No Internet Connection", code: 0));
      }

      final remoteData = await homeRemoteDatasource.getCategories();
      await homeLocalDatasource.cacheCategories(remoteData);

      return Right(remoteData);
    } catch (error) {
      final handledError = ErrorHandler.handle(error).apiErrorModel;
      return Left(handledError);
    }
  }
  Duration flashSaleDuration = const Duration(hours: 2);
  Timer? _timer;

  final StreamController<Duration> _flashSaleController =
      StreamController<Duration>.broadcast();

  Stream<Duration> get flashSaleStream => _flashSaleController.stream;

  void startFlashSale() {
    _timer?.cancel();
    flashSaleDuration = const Duration(hours: 2);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (flashSaleDuration.inSeconds <= 0) {
        _timer?.cancel();
      } else {
        flashSaleDuration -= const Duration(seconds: 1);
        _flashSaleController.add(flashSaleDuration);
      }
    });
  }

  void dispose() {
    _timer?.cancel();
    _flashSaleController.close();
  }
}
