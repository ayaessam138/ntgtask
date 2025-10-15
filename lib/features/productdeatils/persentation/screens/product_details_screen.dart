import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/core/widgets/app_cach_image.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';
import 'package:ntgtask/features/fav/persentation/controller/bloc/favourite_bloc.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoritesBloc>(
      context,
    ).add(CheckIfFavoriteEvent(widget.product.id ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white(context),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppPadding.p20),
        child: GestureDetector(
          onTap: () {
            BlocProvider.of<CartBloc>(
              context,
            ).add(AddToCartEvent(widget.product));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  spacing: AppWidth.w8,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.white),

                    Expanded(
                      child: Text(
                        AppStrings.addedToCart(context: context),
                        style: TextStyles.font12Medium.copyWith(
                          color: Colors.white,
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
          child: Container(
            decoration: BoxDecoration(
              color: ColorsManager.mainColor(context),
              borderRadius: BorderRadius.circular(16),
            ),
            width: AppWidth.fullWidth(context),
            height: 55.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_shopping_cart, color: ColorsManager.white(context)),
                AutoSizeText(
                  AppStrings.addToCart(context: context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font16Bold.copyWith(
                    color: ColorsManager.white(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: ColorsManager.white(context),
            elevation: 1,
            automaticallyImplyLeading: true,


            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  AppStrings.productDetails(context: context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font18Bold,
                ),
                BlocListener<FavoritesBloc, FavouriteState>(
                  listener: (context, state) {
                    if (state is FavCheckState) {
                      setState(() {
                        isFav = state.isFavorite;
                      });
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      if (isFav) {
                        BlocProvider.of<FavoritesBloc>(
                          context,
                        ).add(RemoveFromFavoritesEvent(widget.product.id ?? 0));
                      } else {
                        BlocProvider.of<FavoritesBloc>(
                          context,
                        ).add(AddToFavoritesEvent(widget.product));
                      }
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    child: isFav
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border, color: Colors.black),
                  ),
                ),
              ],
            ),
            iconTheme:  IconThemeData(color: ColorsManager.black(context)),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(AppPadding.p20),
              child: Hero(
                tag: widget.product.id ?? '',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AppCachImage(
                    backgroundColor: ColorsManager.white(context),
                    isNoBaseUrl: true,
                    isNotCircle: true,
                    boxFit: BoxFit.contain,
                    height: AppHeight.fullHeight(context) * .3,
                    width: AppWidth.fullWidth(context),
                    image: widget.product.image ?? '',
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppWidth.w20),
              child: Column(
                spacing: AppHeight.h8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.product.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font18Bold,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "\$${(widget.product.price ?? 0).toStringAsFixed(2)}",
                        style: TextStyles.font24Bold.copyWith(
                          color: ColorsManager.mainColor(context),
                        ),
                      ),
                      Row(
                        spacing: AppWidth.w4,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 22.sp),
                          AutoSizeText(
                            "${widget.product.rating?.rate ?? 0}",
                            style: TextStyles.font16Medium,
                          ),
                          AutoSizeText(
                            " (${widget.product.rating?.count ?? 0})",
                            style: TextStyles.font14Light.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppWidth.w12,
                      vertical: AppHeight.h4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsManager.greyColor(context),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.product.category?.toUpperCase() ?? '',
                      style: TextStyles.font14Medium.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ),

                  AppSpace.vertical(AppHeight.h20),

                  AutoSizeText(
                    AppStrings.description(context: context),
                    style: TextStyles.font20Semi,
                  ),
                  AutoSizeText(
                    widget.product.description ?? '',
                    style: TextStyles.font16Regular.copyWith(height: 1.5),
                  ),

                  // AppSpace.vertical(AppHeight.h80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
