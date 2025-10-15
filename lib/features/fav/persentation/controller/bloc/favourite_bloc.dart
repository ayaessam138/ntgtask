import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ntgtask/features/fav/data/repo/fav_repo.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';


class FavoritesBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final FavRepo repo;

  FavoritesBloc({required this.repo}) : super(FavouriteInitial()) {

    on<LoadFavoritesEvent>((event, emit) async {
      emit(FavLoading());
      final favItems = await repo.getFavorites();
      emit(FavLoaded(favItems));
    });


    on<AddToFavoritesEvent>((event, emit) async {
      await repo.addToFavorites(event.product);
      final favItems = await repo.getFavorites();
      emit(FavLoaded(favItems));
    });


    on<RemoveFromFavoritesEvent>((event, emit) async {
      await repo.removeFromFavorites(event.productId);
      final favItems = await repo.getFavorites();
      emit(FavLoaded(favItems));
    });


    on<CheckIfFavoriteEvent>((event, emit) async {
      final isFav = await repo.isFavorite(event.productId);
      emit(FavCheckState(isFav));
    });
  }
}
