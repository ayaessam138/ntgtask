import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ntgtask/core/error_handle/api_error_model.dart';
import 'package:ntgtask/features/fav/data/repo/fav_repo.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavoritesBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavRepo repo;

  FavoritesBloc({required this.repo}) : super(FavouriteInitial()) {
    on<LoadFavoritesEvent>((event, emit) async {
      await getFavorites(emit);
    });

    on<AddToFavoritesEvent>((event, emit) async {
      await addFavorite(event.product, emit);
    });

    on<RemoveFromFavoritesEvent>((event, emit) async {
      await removeFavorite(event.productId, emit);
    });

  
  }

  Future<void> getFavorites(Emitter<FavouriteState> emit) async {
    emit(FavLoading());
    final result = await repo.getFavorites();
    result.fold(
      (error) => emit(FavError(error)),
      (products) => emit(FavLoaded(products)),
    );
  }

  Future<void> addFavorite(
    ProductModel product,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavLoading());

    final addResult = await repo.addToFavorites(product);

    await addResult.fold(
      (error) async => emit(FavError(error)),
      (_) async => await getFavorites(emit),
    );
  }

  Future<void> removeFavorite(
    int productId,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavLoading());

    final removeResult = await repo.removeFromFavorites(productId);

    await removeResult.fold(
      (error) async => emit(FavError(error)),
      (_) async => await getFavorites(emit),
    );
  }

  
}
