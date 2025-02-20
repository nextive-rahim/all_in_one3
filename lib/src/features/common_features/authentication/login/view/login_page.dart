import 'package:all_in_one3/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/delete_dailog.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/common_features/authentication/forget_password/view/forget_password_email_page.dart';
import 'package:all_in_one3/src/features/common_features/authentication/login/controller/login_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/authentication/registration/view/choose_engagement_page.dart';
import 'package:all_in_one3/src/features/common_features/authentication/root/widgets/auth_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginViewController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      backgroundColor: CommonColor.whiteColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthHeader(
                      title: 'Login to your account',
                      subtitle: 'Hey ✋ welcome back!',
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CommonColor.whiteColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 80,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(21.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OutlinedInputField(
                              labelText: AppStrings.username,
                              controller: controller.userNameController,
                              hintText: AppStrings.hitTextUsername,
                              validator: InputFieldValidator.email(),
                            ),
                            OutlinedInputField(
                              labelText: AppStrings.password,
                              controller: controller.passwordController,
                              hintText: AppStrings.passwordHintext,
                              isPasswordField: true,
                              validator: InputFieldValidator.password(),
                            ),
                            10.sh,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<
                                        ForgetPasswordEmailPage
                                      >(
                                        builder:
                                            (BuildContext context) =>
                                                ForgetPasswordEmailPage(),
                                      ),
                                    );
                                    // Get.toNamed(Routes.forgetPasswordEmailPage);
                                  },
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: AppColors.primary,
                                          offset: Offset(0, -3),
                                        ),
                                      ],
                                      color: Colors.transparent,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primary,
                                      decorationThickness: 1,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Obx(
                              () => PrimaryButton(
                                isLoading:
                                    controller.pageState == PageState.loading,
                                onTap: onTap,
                                //widget: const Text(AppStrings.loginToMyAccount)
                                title: AppStrings.loginToMyAccount,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have any account?',

                                  style: TextStyle(
                                    color: Color(0xFF5A5959),
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<ChooseEngagementPage>(
                                        builder:
                                            (BuildContext context) =>
                                                ChooseEngagementPage(),
                                      ),
                                    );
                                    //  Get.toNamed(Routes.engagement);
                                  },
                                  child: Text(
                                    AppStrings.registerNow,

                                    style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: AppColors.primary,
                                          offset: Offset(0, -1),
                                        ),
                                      ],
                                      color: Colors.transparent,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.primary,
                                      decorationThickness: 1,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 47),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 41),
                    Container(
                      width: SizeConfig.screenWidth,
                      height: 1,
                      color: CommonColor.backgroundColor2,
                    ),
                    const SizedBox(height: 21),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: CommonColor.headingTextColor1,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const TextWidget(
                              text: AppStrings.termsOfUse,
                              color: CommonColor.headingTextColor1,
                              maxLine: 1,
                              fontFamily: AppStrings.aeonikTRIAL,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: CommonColor.headingTextColor1,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const TextWidget(
                              text: AppStrings.dataCollectionRights,
                              color: CommonColor.headingTextColor1,
                              maxLine: 1,
                              fontFamily: AppStrings.aeonikTRIAL,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 3,
                              height: 3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: CommonColor.headingTextColor1,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const TextWidget(
                              text: AppStrings.privacyAndPolicy,
                              color: CommonColor.headingTextColor1,
                              maxLine: 1,
                              fontFamily: AppStrings.aeonikTRIAL,
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const TextWidget(
                      text: AppStrings.appVersion,
                      color: CommonColor.lightGreyForText1,
                      maxLine: 1,
                      fontFamily: AppStrings.aeonikTRIAL,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    controller.login(_formKey).then((response) {
      if (controller.loginModel.success == false &&
          controller.loginModel.message ==
              'User is not active. Please check your email to verify your account.') {
        deleteDailog(
          context: context,
          message: 'please check your email and verify your account',
          title: 'Do you want to verify account?',
          yesText: 'Yes, Verify',
          onTap: () {
            controller.resentOtpForVerifyMail().then((value) {
              SnackBarService.showInfoSnackBar(
                controller.loginModel.message.toString(),
              );
            });
            Navigator.of(context).pop();
          },
        );

        return;
      }
      if (controller.loginModel.success == false) {
        SnackBarService.showErrorSnackBar(
          controller.loginModel.message.toString(),
        );

        return;
      }
      if (controller.loginModel.data?.userType == 1) {
        if (kIsWeb) {
          Get.rootDelegate.toNamed(Routes.bottomNavBarStudent);
          // Get.offNamed(Routes.bottomNavBarStudent);
        } else {
          Get.offNamed(Routes.bottomNavBarStudent);
        }
      } else if (controller.loginModel.data?.userType == 2) {
        if (kIsWeb) {
          Get.offNamed(Routes.bottomNavBarEmployee);
        } else {
          Get.offNamed(Routes.bottomNavBarEmployee);
        }
      } else if (controller.loginModel.data?.userType == 3) {
        if (kIsWeb) {
          Get.offNamed(Routes.bottomNavBarCompany);
        } else {
          //
          Get.offNamed(Routes.bottomNavBarCompany);
        }
      } else if (controller.loginModel.data?.userType == 4) {
        if (kIsWeb) {
          Get.offNamed(Routes.bottomNavBarInterview);
        } else {
          Get.offNamed(Routes.bottomNavBarInterview);
        }
      }
    });
  }
}
