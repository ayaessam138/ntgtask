import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ntgtask/features/home/data/model/product_model.dart';
import 'package:ntgtask/features/productdeatils/data/repo/products_details_repo.dart';

part 'products_detiails_event.dart';
part 'products_detiails_state.dart';

class ProductsDetiailsBloc
    extends Bloc<ProductsDetiailsEvent, ProductsDetiailsState> {
  final ProductDetailsRepo repo;
  ProductsDetiailsBloc({required this.repo})
    : super(ProductsDetiailsInitial()) {
    on<LoadProductDetailsEvent>(_onLoadProductDetails);
  }

  Future<void> _onLoadProductDetails(
    LoadProductDetailsEvent event,
    Emitter<ProductsDetiailsState> emit,
  ) async {
    emit(ProductDetailsLoading());

    final result = await repo.getProduct(id: event.productId);

    result.fold(
      (error) => emit(
        ProductDetailsFailure(error.message ?? "Failed to load product"),
      ),
      (product) => emit(ProductDetailsLoaded(product)),
    );
  }
}
