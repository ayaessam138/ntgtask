import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/core/widgets/app_cach_image.dart';
import 'package:ntgtask/features/fav/persentation/controller/bloc/favourite_bloc.dart';
import 'package:ntgtask/features/productdeatils/persentation/widgets/product_details_shimmer_widget.dart';
import 'package:ntgtask/features/profile/bloc/products_detiails_bloc.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({super.key, required this.productId});
  final int productId;
  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  bool isFav = false;
  @override
  void initState() {
    super.initState();

    BlocProvider.of<ProductsDetiailsBloc>(
      context,
    ).add(LoadProductDetailsEvent(productId: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsDetiailsBloc, ProductsDetiailsState>(
      buildWhen: (previous, current) =>
          current is ProductDetailsLoaded ||
          current is ProductDetailsLoading ||
          current is ProductDetailsFailure,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return ProductDetailsShimmerWidget();
        } else if (state is ProductDetailsFailure) {
          return Center(child: Text(state.message));
        } else if (state is ProductDetailsLoaded) {
          var product = state.product;
          return CustomScrollView(
            physics: const ClampingScrollPhysics(),
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
                    }),
                  ],
                ),
                iconTheme: IconThemeData(color: ColorsManager.black(context)),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p20),
                  child: Hero(
                    tag: product.id ?? '',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AppCachImage(
                        backgroundColor: ColorsManager.white(context),
                        isNoBaseUrl: true,
                        isNotCircle: true,
                        boxFit: BoxFit.contain,
                        height: AppHeight.fullHeight(context) * .3,
                        width: AppWidth.fullWidth(context),
                        image: product.image ?? '',
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
                        product.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font18Bold,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "\$${(product.price ?? 0).toStringAsFixed(2)}",
                            style: TextStyles.font24Bold.copyWith(
                              color: ColorsManager.mainColor(context),
                            ),
                          ),
                          Row(
                            spacing: AppWidth.w4,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 22.sp,
                              ),
                              AutoSizeText(
                                "${product.rating?.rate ?? 0}",
                                style: TextStyles.font16Medium,
                              ),
                              AutoSizeText(
                                " (${product.rating?.count ?? 0})",
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
                          product.category?.toUpperCase() ?? '',
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
                        product.description ?? '',
                        style: TextStyles.font16Regular.copyWith(height: 1.5),
                      ),

                      // AppSpace.vertical(AppHeight.h80),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
