import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntgtask/core/helpers/app_spacing.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/core/theming/styles.dart';
import 'package:ntgtask/features/home/persentation/controller/bloc/home_bloc.dart';

class FlashsalseCountdownWidget extends StatelessWidget {
  const FlashsalseCountdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        Duration remaining = const Duration(hours: 2);
        if (state is FlashSaleCountdownState) {
          remaining = state.remaining;
        }

        // Format as HH:mm:ss
        final hours = remaining.inHours.toString().padLeft(2, '0');
        final minutes = (remaining.inMinutes % 60).toString().padLeft(2, '0');
        final seconds = (remaining.inSeconds % 60).toString().padLeft(2, '0');

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppWidth.w16,
            vertical: AppHeight.h4,
          ),
          decoration: BoxDecoration(
            color: ColorsManager.redColor(context),
            borderRadius: BorderRadius.circular(AppRadius.r12),
          ),
          child: AutoSizeText(
            '$hours:$minutes:$seconds',
            maxLines: 1,
            style: TextStyles.font14Bold.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }
}
