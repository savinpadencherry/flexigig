library splash_view;

import 'dart:async';
import 'dart:developer';

import 'package:flexigig/core/locator.dart';
import 'package:flexigig/core/services/navigator_service.dart';
import 'package:flexigig/views/home/home_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';

part 'splash_mobile.dart';
part 'splash_tablet.dart';
part 'splash_desktop.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: _SplashMobile(),
        desktop: const _SplashDesktop(),
        tablet: const _SplashTablet(),
      );
    });
  }
}
