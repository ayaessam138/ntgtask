part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class LoadProductsEvent extends HomeEvent {
  final bool isRefresh;
   LoadProductsEvent({this.isRefresh = false});
}


class LoadCategoriesEvent extends HomeEvent {
  final bool isRefresh;
   LoadCategoriesEvent({this.isRefresh = false});
}
class StartFlashSaleEvent extends HomeEvent {}