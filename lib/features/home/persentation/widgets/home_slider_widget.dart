import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_images.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(3, (index) {
        return Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xFF015B8A), Color(0x00015B8A)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppWidth.w16, vertical:AppHeight.h8),
                  child: Column(
                    spacing: AppHeight.h8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        '50% Off Today',
                        style: TextStyles.font18Semi.copyWith(
                          color: ColorsManager.white(context),
                        ),
                        maxLines: 1,
                        minFontSize: 12, 
                        stepGranularity: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      AutoSizeText(
                        'Limited-time picks just for you',
                        style: TextStyles.font14Regular.copyWith(
                          color: ColorsManager.white(context),
                        ),
                        maxLines: 2,
                        minFontSize: 10,
                        stepGranularity: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12.h),
                      Container(
                        width: 95.w,
                        height: 32.h,
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: ColorsManager.white(context),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            AppStrings.shopNow(context: context),
                            maxLines: 1,
                            minFontSize: 10,
                            stepGranularity: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.font12semi.copyWith(
                              color: ColorsManager.mainColor(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Image.asset(
                  AppImages.slider,
                  width: 100.w,
                  height: 110.h,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      }),
      options: CarouselOptions(
        height: AppHeight.fullHeight(context) * .3,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );
  }
}
