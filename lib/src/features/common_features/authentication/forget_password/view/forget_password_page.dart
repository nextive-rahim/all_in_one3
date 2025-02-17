import 'package:all_in_one3/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/features/common_features/authentication/forget_password/controller/forget_password_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/authentication/root/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final controller = Get.find<ForgetPasswordViewController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Forget Password'),
      // ),
      backgroundColor: CommonColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthHeader(
                    title: 'Enter your password',
                    subtitle: 'Reset password',
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
                            autofocus: true,
                            labelText: AppStrings.password,
                            controller: controller.passwordController,
                            hintText: AppStrings.passwordHintext,
                            validator: InputFieldValidator.password(),
                            isPasswordField: true,
                            onChanged: (v) {
                              if (v.isEmpty || v.length >= 6) {
                                setState(() {});
                              }
                            },
                          ),
                          OutlinedInputField(
                            labelText: AppStrings.confirmPassword,
                            controller: controller.comfirmPasswordController,
                            hintText: AppStrings.confirmPasswordAgain,
                            isPasswordField: true,
                            validator: InputFieldValidator.confirmPassword(
                              password: controller.passwordController.text,
                              optional:
                                  controller.passwordController.text.isEmpty,
                            ),
                            onChanged: (v) {
                              if (v.isEmpty || v.length >= 6) {
                                setState(() {});
                              }
                            },
                          ),
                          10.sh,
                          const SizedBox(height: 20),
                          Obx(
                            () => PrimaryButton(
                              isLoading:
                                  controller.pageState == PageState.loading,
                              onTap: onTap,
                              title: 'Reset Password',
                            ),
                          ),
                          // const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
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
    controller.resetPassword(_formKey).then((response) {
      if (controller.loginModel.success == false) {
        SnackBarService.showErrorSnackBar(
          controller.loginModel.message.toString(),
        );
      } else {
        SnackBarService.showInfoSnackBar(
          controller.loginModel.message.toString(),
        );

        Get.offNamed(Routes.login);
      }
    });
  }
}
