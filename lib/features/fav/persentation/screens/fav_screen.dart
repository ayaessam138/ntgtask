import 'package:flutter/material.dart';
import 'package:ntgtask/core/theming/colors.dart';
import 'package:ntgtask/features/fav/persentation/widgets/fav_appbar_widget.dart';
import 'package:ntgtask/features/fav/persentation/widgets/fav_gridview_widget.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FavAppbarWidget(),
              FavGridviewWidget()
            ],
          ),
        ),
      ),
    );
  }
}