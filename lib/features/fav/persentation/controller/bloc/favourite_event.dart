part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}
class LoadFavoritesEvent extends FavouriteEvent {}

class AddToFavoritesEvent extends FavouriteEvent {
  final ProductModel product;

  const AddToFavoritesEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromFavoritesEvent extends FavouriteEvent {
  final int productId;

  const RemoveFromFavoritesEvent(this.productId);

  @override
  List<Object> get props => [productId];
}

class CheckIfFavoriteEvent extends FavouriteEvent {
  final int productId;

  const CheckIfFavoriteEvent(this.productId);

  @override
  List<Object> get props => [productId];
}
