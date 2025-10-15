import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';

class CartAppbarWidget extends StatelessWidget {
  const CartAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      color: ColorsManager.white(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => BlocProvider.of<BottomNavBarCubit>(context).changeIndex(0),
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.greyColor(context)),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: ColorsManager.black(context),
                ),
              ),
            ),
          ),
          AutoSizeText(
            AppStrings.cart(context: context),
            textAlign: TextAlign.center,
            style: TextStyles.font20semi.copyWith(color: ColorsManager.black(context)),
            maxLines: 1,
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<CartBloc>(context).add(ClearCart());
            },
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.greyColor(context)),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(Icons.delete, color: ColorsManager.black(context)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
