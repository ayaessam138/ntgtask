
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w24),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w4,
          vertical: AppHeight.h4,
        ),
        decoration: BoxDecoration(
          color: ColorsManager.white(context),
          borderRadius: BorderRadius.circular(AppRadius.r35),
          border: Border.all(color: ColorsManager.greyColor(context)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                spacing: AppWidth.w8,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xfff2f2f2),width: 2),
                      shape: BoxShape.circle,
                      color: Color(0xFFf6f6f6),
                    ),
                    padding: EdgeInsets.all(AppPadding.p12),
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 20.sp,
                      
                    ),
                  ),
              
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          "Send to",
                          maxLines: 1,
                          style: TextStyles.font12semi.copyWith(
                            color: ColorsManager.darkGreyColor(context),
                          ),
                        ),
                        AutoSizeText(
                          "Brisbane, Queensland",
                          maxLines: 1,
                          style: TextStyles.font12semi.copyWith(
                            color: ColorsManager.black(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              child: Container(
                width: 92.w,
                height: 40.h,
                padding: EdgeInsets.symmetric(horizontal: AppWidth.w16,vertical: AppHeight.h10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r20),
                  color: ColorsManager.mainColor(context),
                ),
                child: Center(
                  child: AutoSizeText(
                    AppStrings.change(context: context),
                    style: TextStyles.font16Medium.copyWith(
                      color: ColorsManager.white(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ntgtask/core/helpers/app_spacing.dart';
// import 'package:ntgtask/core/helpers/app_strings.dart';
// import 'package:ntgtask/core/theming/colors.dart';
// import 'package:ntgtask/core/theming/styles.dart';

// class HomeSearchWidget extends StatelessWidget {
//   const HomeSearchWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//      padding:  EdgeInsets.symmetric(horizontal: AppWidth.w24,),
//       child: TextField(
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: ColorsManager.white,
//           prefixIcon: Padding(
//             padding: EdgeInsets.all(AppPadding.p4),
//             child: Row(
//               spacing: AppWidth.w8,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: ColorsManager.greyColor,
//                   ),
//                   padding: EdgeInsets.all(AppPadding.p12),
//                   child: Icon(
//                     Icons.location_on_outlined,
//                     color: ColorsManager.darkMainColor,
//                   ),
//                 ),
//                  Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AutoSizeText(
//                       "Send to",
//                       maxLines: 1,
//                       style: TextStyles.font12semi.copyWith(
//                         color: ColorsManager.greyColor,
//                       ),
//                     ),
//                      AutoSizeText(
//                       "Brisbane, Queeensland",
//                       maxLines: 1,
//                       style: TextStyles.font12semi.copyWith(
//                         color: ColorsManager.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           suffixIcon: Padding(
//             padding: EdgeInsets.all(AppPadding.p4),
//             child: Container(
//               width: 60.w,
//               height: 40.h,
//               padding: EdgeInsets.symmetric(
//                 horizontal: AppWidth.w12,
//                 vertical: AppHeight.h8,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppRadius.r20),
//                 color: ColorsManager.mainColor,
//               ),
//               child: Center(
//                 child: AutoSizeText(
//                   AppStrings.change(context: context),
//                   style: TextStyles.font20Semi.copyWith(
//                     color: ColorsManager.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppRadius.r35),
//             borderSide: BorderSide(color: ColorsManager.greyColor),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppRadius.r35),
//             borderSide: BorderSide(color: ColorsManager.greyColor),
//           ),
//         ),
//       ),
//     );
//   }
// }