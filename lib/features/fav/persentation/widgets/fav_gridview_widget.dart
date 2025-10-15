import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/core/widgets/products_shimmer_widget.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';
import 'package:ntgtask/features/fav/persentation/controller/bloc/favourite_bloc.dart';
import 'package:ntgtask/core/widgets/products_gridview_card_widget.dart';
import 'package:ntgtask/features/productdeatils/persentation/screens/product_details_screen.dart';

class FavGridviewWidget extends StatefulWidget {
  const FavGridviewWidget({super.key});

  @override
  State<FavGridviewWidget> createState() => _FavGridviewWidgetState();
}

class _FavGridviewWidgetState extends State<FavGridviewWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoritesBloc>(context).add(LoadFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 14.w;
    final double itemWidth = (AppWidth.fullWidth(context) - spacing * 3) / 2;
    return BlocBuilder<FavoritesBloc, FavouriteState>(
      buildWhen: (previous, current) =>
          current is FavLoaded || current is FavLoading || current is FavError,
      builder: (context, state) {
        if (state is FavLoading) {
         return ProductsGridViewShimmerWidget();
        } else if (state is FavError) {
          return Center(child: Text(state.message.message??''));
        } else if (state is FavLoaded) {
          var favProductsList = state.favItems;
          return favProductsList.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing),
                  child: Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: List.generate(
                      favProductsList.length,
                      (index) => SizedBox(
                        width: itemWidth,
                        child: ProductGridviewCardWidget(
                          productModel: favProductsList[index],
                          onTapAddToCart: () {
                            //add to cart
                            BlocProvider.of<CartBloc>(
                              context,
                            ).add(AddToCartEvent(favProductsList[index]));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  spacing: AppWidth.w8,
                                  children: [
                                     Icon(
                                      Icons.check_circle,
                                      color: ColorsManager.white(context),
                                    ),

                                    Expanded(
                                      child: Text(
                                        AppStrings.addedToCart(
                                          context: context,
                                        ),
                                        style: TextStyles.font12Medium.copyWith(
                                               color: ColorsManager.white(context),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                  product: favProductsList[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: AppHeight.fullHeight(context) * 0.6,
                child: Center(
                    child: AutoSizeText(
                      AppStrings.noFav(context: context),
                      style: TextStyles.font20semi,
                    ),
                  ),
              );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
