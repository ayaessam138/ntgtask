import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/core/widgets/products_shimmer_widget.dart';
import 'package:ntgtask/features/cart/persentation/controller/bloc/cart_bloc.dart';
import 'package:ntgtask/features/home/persentation/controller/bloc/home_bloc.dart';
import 'package:ntgtask/core/widgets/products_gridview_card_widget.dart';
import 'package:ntgtask/features/productdeatils/persentation/screens/product_details_screen.dart';

class HomeProductsGridviewWidget extends StatefulWidget {
  const HomeProductsGridviewWidget({super.key});

  @override
  State<HomeProductsGridviewWidget> createState() =>
      _HomeProductsGridviewWidgetState();
}

class _HomeProductsGridviewWidgetState
    extends State<HomeProductsGridviewWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 14.w;
    final double itemWidth = (AppWidth.fullWidth(context) - spacing * 3) / 2;
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is ProductsLoaded ||
          current is ProductsFailure ||
          current is ProductsLoading,
      builder: (context, state) {
        if (state is ProductsLoading) {
          return ProductsGridViewShimmerWidget();
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.message));
        } else if (state is ProductsLoaded) {
          var productsList = state.products;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing),
            child: Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: List.generate(
                productsList.length,
                (index) => SizedBox(
                  width: itemWidth,
                  child: ProductGridviewCardWidget(
                    productModel: productsList[index],
                    onTapAddToCart: () {
                      //add to cart
                      BlocProvider.of<CartBloc>(
                        context,
                      ).add(AddToCartEvent(productsList[index]));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            spacing: AppWidth.w8,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
          
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            product: productsList[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
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
