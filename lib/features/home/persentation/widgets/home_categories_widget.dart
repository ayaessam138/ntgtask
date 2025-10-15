import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ntgtask/core/helpers/app_images.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/features/home/persentation/controller/bloc/home_bloc.dart';
import 'package:ntgtask/features/home/persentation/widgets/home_categories_shimmer_widget.dart';

class HomeCategoriesWidget extends StatefulWidget {
  const HomeCategoriesWidget({super.key});

  @override
  State<HomeCategoriesWidget> createState() => _HomeCategoriesWidgetState();
}

class _HomeCategoriesWidgetState extends State<HomeCategoriesWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is CategoriesFailure ||
          current is CategoriesLoading ||
          current is CategoriesLoaded,
      builder: (context, state) {
        if (state is CategoriesLoading) {
         
         return HomeCategoriesShimmerWidget();
        } else if (state is CategoriesFailure) {
          return Center(child: Text(state.message));
        } else if (state is CategoriesLoaded) {
          final categories = state.categories;

          return Padding(
            padding: EdgeInsets.only(left: AppWidth.w24),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: categories.map((category) {
                  return Padding(
                    padding: EdgeInsets.only(right: AppWidth.w10),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppPadding.p12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsManager.greyColor(context),
                          ),
                          child: Image.asset(AppImages.categoreyIcon),
                        ),

                        SizedBox(
                          width: 80.w,
                          child: AutoSizeText(
                            category,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyles.font14Medium.copyWith(
                              color: ColorsManager.darkMainColor(context),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
