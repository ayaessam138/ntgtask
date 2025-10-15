part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}
class LoadCart extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final ProductModel product;

  const AddToCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCart extends CartEvent {
  final ProductModel product;
  const RemoveFromCart(this.product);
}

class IncrementItem extends CartEvent {
  final ProductModel product;
  const IncrementItem(this.product);
}

class DecrementItem extends CartEvent {
  final ProductModel product;
  const DecrementItem(this.product);
}
class ClearCart extends CartEvent {}