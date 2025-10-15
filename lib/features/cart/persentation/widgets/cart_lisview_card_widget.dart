import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/core/widgets/app_cach_image.dart';
import 'package:ntgtask/features/fav/persentation/controller/bloc/favourite_bloc.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

class CartLisviewCardWidget extends StatelessWidget {
  final ProductModel product;
  final void Function() onTapDecrement;
  final void Function() onTapIncrement;

  const CartLisviewCardWidget({
    super.key,
    required this.product,
    required this.onTapDecrement,
    required this.onTapIncrement,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppWidth.w12,
      children: [
        Expanded(
          flex: 5,
          child: AppCachImage(
            height: AppHeight.fullHeight(context) * .23,
            backgroundColor: ColorsManager.white(context),
            image: product.image ?? '',
            boxFit: BoxFit.cover,
            isNoBaseUrl: true,
            isNotCircle: true,
          ),
        ),
        Expanded(
          flex: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppHeight.h6,
            children: [
              AutoSizeText(
                product.category ?? '',
                style: TextStyles.font12semi.copyWith(
                  color: ColorsManager.greyColor(context),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              AutoSizeText(
                product.title ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font16Semi,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: AppWidth.w12,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppWidth.w4,
                          vertical: AppHeight.h8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                          border: Border.all(color: ColorsManager.greyColor(context)),

                          color: const Color.fromARGB(12, 255, 255, 255),
                        ),
                        child: GestureDetector(
                          onTap: onTapDecrement,
                          child: Icon(
                            Icons.remove,
                            color: ColorsManager.darkMainColor(context),
                          ),
                        ),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          "${product.itemCount}",
                          style: TextStyles.font16Semi,
                          maxLines: 2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppWidth.w4,
                          vertical: AppHeight.h8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorsManager.greyColor(context)),
                          borderRadius: BorderRadius.circular(AppRadius.r8),
                          color: ColorsManager.white(context),
                        ),
                        child: GestureDetector(
                          onTap: onTapIncrement,
                          child: Icon(
                            Icons.add,
                            color: ColorsManager.darkMainColor(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<FavoritesBloc, FavouriteState>(
                    builder: (context, state) {
                      bool isFav = false;

                      if (state is FavLoaded) {
                        isFav = state.favItems.any(
                          (item) => item.id == product.id,
                        );
                      } else if (state is FavCheckState) {
                        isFav = state.isFavorite;
                      }

                      return GestureDetector(
                        onTap: () {
                          if (isFav) {
                            context.read<FavoritesBloc>().add(
                              RemoveFromFavoritesEvent(product.id ?? 0),
                            );
                          } else {
                            context.read<FavoritesBloc>().add(
                              AddToFavoritesEvent(product),
                            );
                          }
                        },
                        child: isFav
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border, color: Colors.black),
                      );
                    },
                  ),

                  AutoSizeText(
                    "${product.price}",
                    style: TextStyles.font16Semi,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
