library home_view;

import 'package:flexigig/core/locator.dart';
import 'package:flexigig/core/services/navigator_service.dart';
import 'package:flexigig/views/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ScreenTypeLayout(
        mobile: const _HomeMobile(),
        desktop: const _HomeDesktop(),
        tablet: const _HomeTablet(),
      );
    });
  }
}
