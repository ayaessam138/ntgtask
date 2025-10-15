
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/helpers/app_strings.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/features/profile/cubit/theme_cubit.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/features/profile/profile_appbar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              ProfileAppbarWidget(),
              Padding(
                padding:  EdgeInsets.all(AppPadding.p10),
                child: InkWell(
                  onTap: () {
                    if (context.locale.languageCode == 'en') {
                      context.setLocale(const Locale('ar'));
                    } else {
                      context.setLocale(const Locale('en'));
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          maxLines: 1,
                          AppStrings.changeLanguage(context: context),
                          style: TextStyles.font16Semi,
                        ),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          maxLines: 1,
                          context.locale.toString(),
                          style: TextStyles.font16Semi,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding:  EdgeInsets.all(AppPadding.p8),
                child: InkWell(
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        
                        child: AutoSizeText(
                          maxLines: 1,
                          AppStrings.changeTheme(context: context),
                          style: TextStyles.font16Semi,
                        ),
                      ),
                      Flexible(
                        child: AutoSizeText(
                          maxLines: 1,
                          context.read<ThemeCubit>().state.toString(),
                          style: TextStyles.font16Semi,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
