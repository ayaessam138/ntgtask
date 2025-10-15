import 'package:flutter/material.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/widgets/simmer_widget.dart';


class HomeCategoriesShimmerWidget extends StatelessWidget {
  const HomeCategoriesShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
  
    final int shimmerItems = 6;

    return Padding(
      padding: EdgeInsets.only(left: AppWidth.w24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: Row(
          children: List.generate(shimmerItems, (index) {
            return Padding(
              padding: EdgeInsets.only(right: AppWidth.w10),
              child: Column(
                children: [
                  // Circle image shimmer
                  AppShimmer(
                    child: Container(
                      width: AppWidth.w50,
                      height: AppWidth.w50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  AppSpace.vertical(AppHeight.h8),
                  // Text shimmer
                  AppShimmer(
                    child: Container(
                      width: AppWidth.w80,
                      height: AppHeight.h16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
