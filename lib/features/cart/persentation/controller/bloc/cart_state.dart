part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}
class CartUpdated extends CartState {
  final List<ProductModel> cartItems;
  final num subtotal;
  final num shippingFee;
  final num taxes;
  final num total;

  const CartUpdated({
    required this.cartItems,
    required this.subtotal,
    this.shippingFee = 0,
    this.taxes = 0,
    required this.total,
  });

  @override
  List<Object> get props => [cartItems, subtotal, shippingFee, taxes, total];
}
