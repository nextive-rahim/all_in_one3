import 'dart:developer';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one3/src/core/service/cache/cache_service.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'dart:html' as html;

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _navigation();
    super.initState();
  }

  _navigation() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      log("Auth Token.... : ${CacheService.boxAuth.read(CacheKeys.token)}");
      if (CacheService.boxAuth.read(CacheKeys.token) == null) {
        if (kIsWeb) {
          html.window.history.replaceState(null, '', Routes.login);
          context.replaceNamed(Routes.login);
        } else {
          html.window.history.replaceState(null, '', Routes.login);
          context.replaceNamed(Routes.login);
        }
      }
      final userType = CacheService.boxAuth.read(CacheKeys.userType);
      print('User Type : $userType');
      if (userType == 1) {
        if (kIsWeb) {
          html.window.history.replaceState(null, '', Routes.homeTab);
          context.replaceNamed(Routes.homeTab);

          // Get.rootDelegate.toNamed(Routes.homeTab);
          // Get.offNamed(Routes.homeTab);
        } else {
          // Get.rootDelegate.toNamed(Routes.homeTab);
          context.goNamed(Routes.homeTab);
        }
      } else if (userType == 2) {
        if (kIsWeb) {
          html.window.history.replaceState(null, '', Routes.homeTabEmployee);
          context.replaceNamed(Routes.homeTabEmployee);

          // Get.offNamed(Routes.bottomNavBarEmployee);
        } else {
          // Get.rootDelegate.toNamed(Routes.homeTab);
          context.goNamed(Routes.bottomNavBarEmployee);
        }
      } else if (userType == 3) {
        if (kIsWeb) {
          html.window.history.replaceState(null, '', Routes.homeTabCompany);
          context.replaceNamed(Routes.homeTabCompany);
        } else {
          context.goNamed(Routes.homeTabCompany);
          // Get.offNamed(Routes.dashboardRegFirstTimeEmployeeWeb);
        }
      } else if (userType == 4) {
        if (kIsWeb) {
          context.goNamed(Routes.bottomNavBarInterview);
        } else {
          context.goNamed(Routes.bottomNavBarInterview);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    log("Auth Token.... : ${CacheService.boxAuth.read(CacheKeys.token)}");
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      body: Center(
        child: Image.asset(
          ImageConstant.flashScreen,
          height: SizeConfig.safeUsedHeight,
          width: SizeConfig.screenWidth,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
