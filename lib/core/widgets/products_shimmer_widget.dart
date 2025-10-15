import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/widgets/simmer_widget.dart';

class ProductsGridViewShimmerWidget extends StatelessWidget {
  const ProductsGridViewShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double spacing = 14.w;
    final double itemWidth = (AppWidth.fullWidth(context) - spacing * 3) / 2;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      child: Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: List.generate(
          6,
          (index) => SizedBox(
            width: itemWidth,

            child: const ProductGridviewCardShimmerWidget(),
          ),
        ),
      ),
    );
  }
}

class ProductGridviewCardShimmerWidget extends StatelessWidget {
  const ProductGridviewCardShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Shimmer
        AppShimmer(
          child: Container(
            width: AppWidth.fullWidth(context),
            height: AppHeight.fullHeight(context) * 0.25,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(AppRadius.r20),
            ),
          ),
        ),
        AppSpace.vertical(AppHeight.h14),

        // Title + Rating
        Row(
          spacing: AppWidth.w10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: AppShimmer(
                child: Container(
                  height: AppHeight.h20,
                  color: Colors.grey[300],
                ),
              ),
            ),
            Expanded(
              child: AppShimmer(
                child: Container(
                  width: AppWidth.w20,
                  height: AppHeight.h20,
                  color: Colors.grey[300],
                ),
              ),
            ),
          ],
        ),
        AppSpace.vertical(AppHeight.h8),

        // Price + Add to Cart
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: AppShimmer(
                      child: Container(
                        width: 50.w,
                        height: AppHeight.h20,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  AppSpace.horizontal(AppWidth.w8),
                  Flexible(
                    child: AppShimmer(
                      child: Container(
                        width: AppWidth.w40,
                        height: AppHeight.h16,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: AppShimmer(
                child: Container(
                  width: AppHeight.h32,
                  height: AppHeight.h32,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(AppRadius.r8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
