import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/theme/theme.dart';

import 'bindings/general_bindings.dart';
import 'routes/app_routes.dart';
import 'utils/constants/colors.dart';

class GApp extends StatelessWidget {
  const GApp({super.key});
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.dark);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return GetMaterialApp(
              title: 'GApp',
              debugShowCheckedModeBanner: false,
              theme: GTheme.lightTheme,
              darkTheme: GTheme.darkTheme,
              themeMode: currentMode,
              initialBinding: GeneralBindings(),
              getPages: AppRoutes.pages,
              home: const Scaffold(
                  backgroundColor: GColors.primary,
                  body: Center(
                      child: CircularProgressIndicator(color: Colors.white))));
        });
  }
}
