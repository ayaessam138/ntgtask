import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntgtask/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';
import 'package:ntgtask/features/fav/persentation/controller/bloc/favourite_bloc.dart';
import 'package:ntgtask/features/profile/cubit/theme_cubit.dart';

import 'dependency_injection.dart';

List<BlocProvider> appBlocProviders() {
  return [
    BlocProvider<BottomNavBarCubit>(
      create: (context) => getIt<BottomNavBarCubit>(),
    ),
    BlocProvider<CartBloc>(
      create: (context) => getIt<CartBloc>()..add(LoadCart()),
    ),
     BlocProvider<ThemeCubit>(
      create: (context) => getIt<ThemeCubit>(),
    ),
     BlocProvider<FavoritesBloc>(
      create: (context) => getIt<FavoritesBloc>()..add(LoadFavoritesEvent()),
    ),
  ];
}
