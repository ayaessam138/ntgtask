import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ntgtask/core/error_handle/api_error_model.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

import 'package:ntgtask/features/home/data/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;

  Duration flashSaleDuration = const Duration(hours: 2); // 2 hours

  HomeBloc({required this.homeRepo}) : super(HomeInitial()) {
    on<LoadProductsEvent>(_getProducts);
    on<LoadCategoriesEvent>(_getCategories);
    on<StartFlashSaleEvent>(_startFlashSale); // new event
  }

  Future<void> _getProducts(
    LoadProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    // if (!event.isRefresh) 
    emit(ProductsLoading());

    final result = await homeRepo.getProducts(isRefresh: event.isRefresh);

    result.fold(
      (ApiErrorModel error) =>
          emit(ProductsFailure(error.message ?? "Failed to load products")),
      (products) => emit(ProductsLoaded(products.cast<ProductModel>())),
    );
  }

  Future<void> _getCategories(
    LoadCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    // if (!event.isRefresh) 
    emit(CategoriesLoading());

    final result = await homeRepo.getCategories(isRefresh: event.isRefresh);

    result.fold(
      (error) =>
          emit(CategoriesFailure(error.message ?? "Failed to load categories")),
      (categories) => emit(CategoriesLoaded(categories)),
    );
  }

  Future<void> _startFlashSale(
    StartFlashSaleEvent event,
    Emitter<HomeState> emit,
  ) async {
    homeRepo.startFlashSale();

    // Listen to the repo stream
    await emit.forEach<Duration>(
      homeRepo.flashSaleStream,
      onData: (remaining) => FlashSaleCountdownState(remaining),
    );
  }
}
