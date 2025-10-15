import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/features/botoomNavbar/persentation/controller/bottom_nav_bar_cubit.dart';


class ProfileAppbarWidget extends StatelessWidget {
  const ProfileAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w12),
      color: ColorsManager.white(context),
      child: Row(
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
          Expanded(
            child: Center(
              child: AutoSizeText(
                AppStrings.profile(context: context),
                textAlign: TextAlign.center,
                style: TextStyles.font20semi.copyWith(color: ColorsManager.black(context)),
                maxLines: 1,
              ),
            ),
          ),
          SizedBox(width: 48.w),
        ],
      ),
    );
  }
}
