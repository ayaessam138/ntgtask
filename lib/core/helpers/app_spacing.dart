import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHeight {
  static double fullHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
  static double hBtnNavBar = 60.h;
  static double h130 = 130.h;
  static double h56 = 56.h;
  static double h40 = 40.h;
  static double h35 = 35.h;
  static double h32 = 32.h;
  static double h25 = 25.h;
  static double h24 = 24.h;
  static double h20 = 20.h;
  static double h10 = 10.h;
  static double h16 = 16.h;
  static double h15 = 15.h;
  static double h14 = 14.h;
  static double h12 = 12.h;
  static double h6 = 6.h;
  static double h8 = 6.h;
  static double h4 = 4.h;
  static double h3 = 3.h;
  static double h1 = 1.h;

}

class AppWidth {
  static double fullWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

static double w80 = 80.w;
  static double w70 = 70.w;
  static double w55 = 55.w;
  static double w50 = 50.w;
  static double w20 = 20.w;
  static double w35 = 35.w;
  static double w40 = 40.w;
  static double w24 = 24.w;
  static double w30 = 30.w;
  static double w16 = 16.w;
  static double w14 = 14.w;
  static double w10 = 10.w;
  static double w12 = 12.w;
  static double w8 = 8.w;
  static double w6 = 6.w;
  static double w2 = 2.w;
  static double w4 = 4.w;
  static double w3= 3.w;
}

class AppFontSize {
  static final f40 = 40.sp;
  static final f35 = 35.sp;
  static final f30 = 30.sp;
  static final f28 = 28.sp;
  static final f26 = 26.sp;
  static final f24 = 24.sp;
  static final f22 = 22.sp;
  static final f20 = 20.sp;
  static final f18 = 18.sp;
  static final f16 = 16.sp;
  static final f14 = 14.sp;
  static final f12 = 12.sp;
  static final f10 = 10.sp;
  static final f2 = 2.sp;
  static final f8 = 8.sp;
  static final f32 = 32.sp;
}


class AppPadding {
  static final p30 = 30.sp;
  static final p24 = 24.sp;
  static final p20 = 20.sp;

  static final p16 = 16.sp;

  static final p12 = 12.sp;
  static final p10 = 10.sp;
  static final p8 = 8.sp;
  static final p6 = 6.sp;
  static final p4 = 4.sp;
  static final p2 = 2.sp;
}

class AppRadius {
  static final rDefault = 4.r;

 
  static final r12 = 12.r;
  static final r4 = 4.r;
  static final r6 = 6.r;
  static final r8 = 8.r;
  static final r13 = 13.r;
  static final r10 = 10.r;
  static final r14 = 14.r;
  static final r15 = 15.r;
  static final r20 = 20.r;
  static final r35 = 35.r;
  static final r48 = 48.r;
  
}
class AppSpace {
  static SizedBox vertical(double height) => SizedBox(
        height: height.h,
      );

  static SizedBox horizontal(double width) => SizedBox(
        width: width.w,
      );
}