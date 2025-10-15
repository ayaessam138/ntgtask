import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/helpers/dependency_injection.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';
import 'package:ntgtask/features/home/data/model/product_model.dart';
import 'package:ntgtask/features/productdeatils/persentation/widgets/product_details_widget.dart';
import 'package:ntgtask/features/profile/bloc/products_detiails_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsDetiailsBloc>(),
      child: Scaffold(
        backgroundColor: ColorsManager.white(context),

        bottomNavigationBar:
            BlocBuilder<ProductsDetiailsBloc, ProductsDetiailsState>(
              buildWhen: (previous, current) =>
                  current is ProductDetailsLoading ||
                  current is ProductDetailsLoaded,
              builder: (context, state) {
                return state is ProductDetailsLoading
                    ? Padding(
                        padding: EdgeInsets.all(AppPadding.p20),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 55.h,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(AppPadding.p20),
                        child: GestureDetector(
                          onTap: () {
                            BlocProvider.of<CartBloc>(
                              context,
                            ).add(AddToCartEvent(product));
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
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: ColorsManager.white(context),
                                ),
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
                      );
              },
            ),

        body: ProductDetailsWidget(productId: product.id!),
      ),
    );
  }
}
