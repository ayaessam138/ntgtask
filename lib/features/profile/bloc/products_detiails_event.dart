part of 'products_detiails_bloc.dart';

sealed class ProductsDetiailsEvent extends Equatable {
  const ProductsDetiailsEvent();

  @override
  List<Object> get props => [];
}
class LoadProductDetailsEvent extends ProductsDetiailsEvent {
  final int productId;

  const LoadProductDetailsEvent( {required this.productId});

  @override
  List<Object> get props => [productId];
}