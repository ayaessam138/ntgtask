part of 'home_bloc.dart';

@immutable
sealed class HomeState {}


final class HomeInitial extends HomeState {}


final class ProductsLoading extends HomeState {}
final class CategoriesLoading extends HomeState {}

final class ProductsLoaded extends HomeState {
  final List<ProductModel> products;
  ProductsLoaded(this.products);
}

final class CategoriesLoaded extends HomeState {
  final List<String> categories;
  CategoriesLoaded(this.categories);
}

final class ProductsFailure extends HomeState {
  final String message;
  ProductsFailure(this.message);
}

final class CategoriesFailure extends HomeState {
  final String message;
  CategoriesFailure(this.message);
}
class FlashSaleCountdownState extends HomeState {
  final Duration remaining;
  FlashSaleCountdownState(this.remaining);
}