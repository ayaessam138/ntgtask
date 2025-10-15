part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();
  
  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {}
class FavInitial extends FavouriteState {}

class FavLoading extends FavouriteState {}

class FavLoaded extends FavouriteState {
  final List<ProductModel> favItems;

  const FavLoaded(this.favItems);

  @override
  List<Object> get props => [favItems];
}

class FavCheckState extends FavouriteState {
  final bool isFavorite;

  const FavCheckState(this.isFavorite);

  @override
  List<Object> get props => [isFavorite];
}

class FavError extends FavouriteState {
  final ApiErrorModel message;

  const FavError(this.message);

  @override
  List<Object> get props => [message];
}
