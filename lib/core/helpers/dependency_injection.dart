import 'package:get_it/get_it.dart';
import 'package:ntgtask/core/helpers/sql_helper.dart';
import 'package:ntgtask/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:ntgtask/features/cart/data/datasource/cart_local_datasource.dart';
import 'package:ntgtask/features/cart/data/repo/cart_repo.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';
import 'package:ntgtask/features/fav/data/datasource/fav_local_datasource.dart';
import 'package:ntgtask/features/fav/data/repo/fav_repo.dart';
import 'package:ntgtask/features/fav/persentation/controller/bloc/favourite_bloc.dart';
import 'package:ntgtask/features/home/data/datasource/home_%20remote_datasource.dart';
import 'package:ntgtask/features/home/data/datasource/home_local_datasource.dart';
import 'package:ntgtask/features/home/data/repo/home_repo.dart';
import 'package:ntgtask/features/home/persentation/controller/bloc/home_bloc.dart';
import 'package:ntgtask/core/cubit/theme_cubit.dart';
import 'package:ntgtask/features/productdeatils/data/datasource/productdetails_remote_datasource.dart';
import 'package:ntgtask/features/productdeatils/data/repo/products_details_repo.dart';
import 'package:ntgtask/features/profile/bloc/products_detiails_bloc.dart';

import '../network/dio_client.dart';
import '../network/network_info.dart';

var getIt = GetIt.instance;

Future initDI() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(() => SqlHelper());
  getIt.registerLazySingleton(() => DioClient());
  getIt.registerFactory<NetworkInfo>(() => NetworkInfoImpl());

  getIt.registerLazySingleton<BottomNavBarCubit>(() => BottomNavBarCubit());
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  //home
  getIt.registerLazySingleton(() => HomeLocalDatasource(sqlHelper: getIt()));

  getIt.registerLazySingleton(() => HomeRemoteDatasource(dioClient: getIt()));

  getIt.registerLazySingleton(
    () => HomeRepo(
      homeLocalDatasource: getIt(),
      homeRemoteDatasource: getIt(),
      networkInfo: getIt(),
    ),
  );
  getIt.registerFactory<HomeBloc>(() => HomeBloc(homeRepo: getIt()));
  //cart
  getIt.registerLazySingleton(() => CartLocalDatasource(sqlHelper: getIt()));
  getIt.registerLazySingleton(() => CartRepo(localDatasource: getIt()));
  getIt.registerFactory<CartBloc>(() => CartBloc(repo: getIt()));
  //fav
  getIt.registerLazySingleton(() => FavLocalDatasource(sqlHelper: getIt()));
  getIt.registerLazySingleton(() => FavRepo(localDatasource: getIt()));
  getIt.registerFactory<FavoritesBloc>(() => FavoritesBloc(repo: getIt()));
  //productdetails
  getIt.registerLazySingleton(() => ProductdetailsRemoteDatasource( dioClient: getIt()));
  getIt.registerLazySingleton(() => ProductDetailsRepo(productdetailsRemoteDatasource: getIt()));
  getIt.registerFactory<ProductsDetiailsBloc>(() => ProductsDetiailsBloc(repo: getIt()));
}
