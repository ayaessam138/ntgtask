import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/helpers/dependency_injection.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/features/home/persentation/controller/bloc/home_bloc.dart';
import 'package:ntgtask/features/home/persentation/widgets/flashsalse_countdown_widget.dart';
import 'package:ntgtask/features/home/persentation/widgets/home_appbar_widget.dart';
import 'package:ntgtask/features/home/persentation/widgets/home_categories_Widget.dart';
import 'package:ntgtask/features/home/persentation/widgets/home_products_gridview_widget.dart';
import 'package:ntgtask/features/home/persentation/widgets/home_search_widget.dart';
import 'package:ntgtask/features/home/persentation/widgets/home_slider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white(context),
      body: BlocProvider(
        create: (context) => getIt<HomeBloc>()..add(StartFlashSaleEvent()),
        child: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final bloc = context.read<HomeBloc>();
              return RefreshIndicator(
                onRefresh: () async {
                  bloc.add(LoadCategoriesEvent(isRefresh: true));
                  bloc.add(LoadProductsEvent(isRefresh: true));
                },
                color: ColorsManager.mainColor(context),
                backgroundColor: ColorsManager.white(context),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppHeight.h20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomeAppbarWidget(),
                        AppSpace.vertical(AppHeight.h32),
                        const HomeSearchWidget(),
                        AppSpace.vertical(AppHeight.h24),
                        const HomeSliderWidget(),
                        AppSpace.vertical(AppHeight.h24),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppWidth.w24,
                          ),
                          child: AutoSizeText(
                            AppStrings.categories(context: context),
                            style: TextStyles.font20Semi,
                          ),
                        ),
                        AppSpace.vertical(AppHeight.h24),
                        const HomeCategoriesWidget(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppWidth.w24,
                            vertical: AppHeight.h16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                AppStrings.flashSale(context: context),
                                style: TextStyles.font20Semi,
                              ),
                              Flexible(child: FlashsalseCountdownWidget()), // countdown for 2 hours
                            ],
                          ),
                        ),
                        const HomeProductsGridviewWidget(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
