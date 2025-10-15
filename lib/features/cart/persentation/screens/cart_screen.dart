import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';
import 'package:ntgtask/features/cart/persentation/widgets/cart_appbar_widget.dart';
import 'package:ntgtask/features/cart/persentation/widgets/cart_listview_widget.dart';
import 'package:ntgtask/features/cart/persentation/widgets/cart_shopping_information_widget.dart';
import 'package:ntgtask/features/cart/persentation/widgets/cart_visa_contanier_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white(context),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            List cartItems = [];
            num subtotal = 0;
            num shippingFee = 0;
            num taxes = 0;
            num total = 0;

            if (state is CartUpdated) {
              cartItems = state.cartItems;
              subtotal = state.subtotal;
              shippingFee = state.shippingFee;
              taxes = state.taxes;
              total = state.total;
            }

            return SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
                child: Column(
                  spacing: AppHeight.h20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartAppbarWidget(),

                    SizedBox(height: AppHeight.h20),

                    if (cartItems.isEmpty)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: AppHeight.h56),
                          child: AutoSizeText(
                            AppStrings.yourCartIsEmpty(context: context),
                            style: TextStyles.font18Medium.copyWith(
                              color: ColorsManager.darkGreyColor(context),
                            ),
                            maxLines: 1,
                          ),
                        ),
                      )
                    else ...[
                      SizedBox(
                        height: AppHeight.fullHeight(context) * 0.35,
                        child: CartListviewWidget(),
                      ),

                      AutoSizeText(
                        AppStrings.shippingInformation(context: context),
                        textAlign: TextAlign.center,
                        style: TextStyles.font20semi.copyWith(
                          color: ColorsManager.black(context),
                        ),
                        maxLines: 1,
                      ),
                   CartVisaContanierWidget(),
                      CartShoppingInformationWidget(
                        subtotal: subtotal,
                        shippingFee: shippingFee,
                        taxes: taxes,
                        total: total,
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
