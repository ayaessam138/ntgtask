import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/core/widgets/app_cach_image.dart';
import 'package:ntgtask/features/fav/persentation/controller/bloc/favourite_bloc.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';



class ProductGridviewCardWidget extends StatelessWidget {
  final ProductModel productModel;
  final void Function() onTapAddToCart;
  final void Function() onTap;

  const ProductGridviewCardWidget({
    super.key,
    required this.productModel,
    required this.onTapAddToCart,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: AppHeight.h14,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                width: AppWidth.fullWidth(context),
                height: AppHeight.fullHeight(context) * .25,
                child: AppCachImage(
                  backgroundColor: ColorsManager.white(context),
                  borderRadius: BorderRadius.circular(AppRadius.r20),
                  isNoBaseUrl: true,
                  isNotCircle: true,
                  image: productModel.image ?? '',
                  boxFit: BoxFit.fill,
                ),
              ),


              BlocBuilder<FavoritesBloc, FavouriteState>(
                builder: (context, state) {
                  bool isFav = false;

                  if (state is FavLoaded) {
                    isFav = state.favItems.any((item) => item.id == productModel.id);
                  }

                  return GestureDetector(
                    onTap: () {
                      if (isFav) {
                        context.read<FavoritesBloc>().add(
                              RemoveFromFavoritesEvent(productModel.id ?? 0),
                            );
                      } else {
                        context.read<FavoritesBloc>().add(
                              AddToFavoritesEvent(productModel),
                            );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isFav
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border, color: Colors.black),
                    ),
                  );
                },
              ),
            ],
          ),

   
          Row(
            spacing: AppWidth.w16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  productModel.title ?? '',
                  style: TextStyles.font14Semi,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: ColorsManager.yellowColor(context)),
                  AutoSizeText(
                    "${productModel.rating?.rate ?? ''}",
                    style: TextStyles.font14Semi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  spacing: AppWidth.w8,
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        "\$${productModel.price}",
                        style: TextStyles.font14Semi,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText(
                        "\$${productModel.price}",
                        style: TextStyles.font12Regular.copyWith(
                          color: ColorsManager.darkGreyColor(context),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onTapAddToCart,
                child: Container(
                  padding: EdgeInsets.all(AppPadding.p8),
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsManager.greyColor(context)),
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: ColorsManager.darkMainColor(context),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
