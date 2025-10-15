import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';
import 'package:ntgtask/features/cart/persentation/widgets/cart_lisview_card_widget.dart';

class CartListviewWidget extends StatelessWidget {
  const CartListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => current is CartUpdated,
      builder: (context, state) {
        List cartItems = [];
        if (state is CartUpdated) {
          cartItems = state.cartItems;
        }
        return ListView.separated(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final product = cartItems[index];
            return CartLisviewCardWidget(
              product: product,
              onTapDecrement: () {
                BlocProvider.of<CartBloc>(context).add(DecrementItem(product));
              },
              onTapIncrement: () {
                BlocProvider.of<CartBloc>(context).add(IncrementItem(product));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return AppSpace.vertical(AppHeight.h14);
          },
        );
      },
    );
  }
}
