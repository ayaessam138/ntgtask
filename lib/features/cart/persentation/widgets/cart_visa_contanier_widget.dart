import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ntgtask/core/helpers/app_images.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';

class CartVisaContanierWidget extends StatelessWidget {
  const CartVisaContanierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p20),
      decoration: BoxDecoration(
        color: ColorsManager.greyColor(context),
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              spacing: AppWidth.w12,
              children: [
                Image.asset(AppImages.visa),
                Flexible(
                  child: AutoSizeText(
                    "**** **** **** 512",
                    textAlign: TextAlign.center,
                    style: TextStyles.font16Semi.copyWith(
                      color: ColorsManager.black(context),
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
