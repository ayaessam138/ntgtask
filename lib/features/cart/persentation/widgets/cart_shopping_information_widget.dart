import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';

class CartShoppingInformationWidget extends StatelessWidget {
  final num subtotal;
  final num shippingFee;
  final num taxes;
  final num total;

  const CartShoppingInformationWidget({
    super.key,
    required this.subtotal,
    required this.shippingFee,
    required this.taxes,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppHeight.h20,
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              AppStrings.total(context: context),
              style: TextStyles.font16Semi,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            AutoSizeText(
              "\$${subtotal.toStringAsFixed(2)}",
              style: TextStyles.font16Semi.copyWith(
                color: ColorsManager.darkGreyColor(context),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

        // Shipping
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              AppStrings.shippingfee(context: context),
              style: TextStyles.font16Semi,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            AutoSizeText(
              "\$$shippingFee",
              style: TextStyles.font16Semi.copyWith(
                color: ColorsManager.darkGreyColor(context),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

        // Taxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              AppStrings.taxes(context: context),
              style: TextStyles.font16Semi,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            AutoSizeText(
              "\$$taxes",
              style: TextStyles.font16Semi.copyWith(
                color: ColorsManager.darkGreyColor(context),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),

        Divider(thickness: 1, color: ColorsManager.greyColor(context)),

        // Total + Checkout Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  AppStrings.total(context: context),
                  style: TextStyles.font14Semi,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
               "\$${total.toStringAsFixed(2)}",
                  style: TextStyles.font20Bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Container(
              width: AppWidth.fullWidth(context) * .4,
              padding: EdgeInsets.all(AppPadding.p12),
              decoration: BoxDecoration(
                color: ColorsManager.mainColor(context),
                borderRadius: BorderRadius.circular(AppRadius.r48),
              ),
              child: Center(
                child: AutoSizeText(
                  AppStrings.checkout(context: context),
                  style: TextStyles.font16Medium.copyWith(
                    color: ColorsManager.white(context),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
