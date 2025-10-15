import 'package:flutter/material.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ntgtask/core/helpers/app_images.dart';
class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: AppWidth.w24,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppImages.applogo),
          Row(
            spacing: AppWidth.w8,
            children: [
              Container(
                padding: EdgeInsets.all(AppPadding.p12),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.greyColor(context)),
                  shape: BoxShape.circle,
                  color: ColorsManager.white(context),
                ),
                child: Center(
                  child: Icon(
                    Icons.search,
                    color: ColorsManager.darkMainColor(context),
                    size: 24.sp,
                  ),
                ),
              ),
               Container(
                padding: EdgeInsets.all(AppPadding.p12),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsManager.greyColor(context)),
                  shape: BoxShape.circle,
                  color: ColorsManager.white(context),
                ),
                child: SvgPicture.asset(AppImages.shoppingBagIcon,height: 24.h,)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
