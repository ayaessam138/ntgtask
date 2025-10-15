import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ntgtask/features/cart/persentation/screens/cart_screen.dart';
import 'package:ntgtask/features/fav/persentation/screens/fav_screen.dart';
import 'package:ntgtask/features/home/persentation/screens/home_screen.dart';
import 'package:ntgtask/features/profile/persentation/screens/profile_screen.dart';

import '../../../../core/helpers/dependency_injection.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());
  static BottomNavBarCubit get get => getIt();

  List<Widget> pages = [
    HomeScreen(),
    FavScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    emit(BottomNavBarInitial());
    currentIndex = index;
    print("changeIndexchangeIndex");
    print(currentIndex);
    emit(BottomNavBarChangeIndex());
  }
}
