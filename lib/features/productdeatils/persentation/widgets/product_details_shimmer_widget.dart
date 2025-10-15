import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/theming/colors.dart';

class ProductDetailsShimmerWidget extends StatelessWidget {
  const ProductDetailsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        // AppBar shimmer
        SliverAppBar(
          surfaceTintColor: Colors.transparent,
          pinned: true,
          backgroundColor: ColorsManager.white(context),
          elevation: 1,
          automaticallyImplyLeading: true,
          title: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 20.h,
              width: AppWidth.fullWidth(context) * 0.3,
              color: Colors.grey[300],
            ),
          ),
        ),

        // Product Image shimmer
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(AppWidth.w20),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: AppHeight.fullHeight(context) * 0.3,
                width: AppWidth.fullWidth(context),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          ),
        ),

        // Product details shimmer
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppWidth.w20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppHeight.h12,
              children: [
                // Title
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20.h,
                    width: AppWidth.fullWidth(context) * 0.6,
                    color: Colors.grey[300],
                  ),
                ),

                // Price
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 20.h,
                    width: AppWidth.fullWidth(context) * 0.3,
                    color: Colors.grey[300],
                  ),
                ),

                // Category
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 18.h,
                    width: AppWidth.fullWidth(context) * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),

                AppSpace.vertical(AppHeight.h16),

                // Description lines
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: AppHeight.h8),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 15.h,
                          width:
                              AppWidth.fullWidth(context) * (0.8 - index * 0.1),
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                ),

                AppSpace.vertical(80.h), // space for bottom button
              ],
            ),
          ),
        ),
      ],
    );
  }
}
