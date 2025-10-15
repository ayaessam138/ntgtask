import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BottomNavBarCubit.get;

    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      buildWhen: (previous, current) => current is BottomNavBarChangeIndex,
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: cubit.pages[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: ColorsManager.white(context)),
            child: GNav(
              selectedIndex: cubit.currentIndex,
              backgroundColor: ColorsManager.white(context),
              gap: AppWidth.fullWidth(context) * 0.01,
              iconSize: 20.sp,
              padding: EdgeInsets.symmetric(
                horizontal: AppWidth.fullWidth(context) * 0.03,
                vertical: 10.h,
              ),
              tabMargin: EdgeInsets.symmetric(
                horizontal: AppWidth.fullWidth(context) * 0.015,
                vertical: 6.h,
              ),
              tabBorderRadius: 50.r,
              color: ColorsManager.darkGreyColor(context),
              activeColor: ColorsManager.white(context),
              tabBackgroundColor: ColorsManager.mainColor(context),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutExpo,
              haptic: false,
              rippleColor: Colors.transparent,
              hoverColor: Colors.transparent,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: AppStrings.home(context: context),
                ),
                GButton(
                  icon: Icons.favorite,
                  text: AppStrings.favorite(context: context),
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: AppStrings.cart(context: context),
                ),
                GButton(
                  icon: Icons.person,
                  text: AppStrings.profile(context: context),
                ),
              ],
              onTabChange: (index) => cubit.changeIndex(index),
            ),
          ),
        );
      },
    );
  }
}
