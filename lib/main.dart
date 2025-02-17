import 'package:all_in_one3/src/core/navigation/router_configuration.dart';
import 'package:all_in_one3/src/core/service/cache/cache_service.dart';
import 'package:all_in_one3/src/core/theme/theme.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;

void replaceBrowserHistory(dynamic data, String path) {
  html.window.history.replaceState(data, '', path);
}

Future<void> main() async {
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;
    return GetMaterialApp.router(
      navigatorObservers: [RouteObserver<ModalRoute<void>>()],
      key: UniqueKey(),
      scaffoldMessengerKey: SnackBarService.scaffoldKey,
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      //routerConfig: router,
      builder: (_, router) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: router!,
        );
      },
      theme: themeData,
    );
  }
}

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    super.key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  });

  /// mobile < 650
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  /// tablet >= 650
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650;

  ///desktop >= 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 650) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}

///...... Student........
/// largeitlink2@gmail.com   type :1

///...... Employee........
///allahborosa983@gmail.com  type :2

///...... Company........
/// rahim.nextive@gmail.com   type :3

///...... Interviwer........
///rahimsr983@gmail.com type :4
