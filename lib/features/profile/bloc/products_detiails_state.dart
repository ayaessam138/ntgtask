part of 'products_detiails_bloc.dart';

sealed class ProductsDetiailsState extends Equatable {
  const ProductsDetiailsState();
  
  @override
  List<Object> get props => [];
}

final class ProductsDetiailsInitial extends ProductsDetiailsState {}
class ProductDetailsLoading extends ProductsDetiailsState {}

class ProductDetailsLoaded extends ProductsDetiailsState {
  final ProductModel product;

  const ProductDetailsLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class ProductDetailsFailure extends ProductsDetiailsState {
  final String message;

  const ProductDetailsFailure(this.message);

  @override
  List<Object> get props => [message];
}