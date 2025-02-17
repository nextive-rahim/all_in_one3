import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/features/common_features/authentication/forget_password/controller/forget_password_email_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/authentication/root/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordEmailPage extends StatefulWidget {
  const ForgetPasswordEmailPage({super.key});

  @override
  State<ForgetPasswordEmailPage> createState() =>
      _ForgetPasswordEmailPageState();
}

class _ForgetPasswordEmailPageState extends State<ForgetPasswordEmailPage> {
  final controller = Get.find<ForgetPasswordEmailViewController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Verify Mail'),
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
                    title: 'Enter your email',
                    subtitle: 'Enter email to reset password',
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
                            labelText: AppStrings.username,
                            controller: controller.userNameController,
                            hintText: AppStrings.hitTextUsername,
                            validator: InputFieldValidator.email(),
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => PrimaryButton(
                              isLoading:
                                  controller.pageState == PageState.loading,
                              onTap: onTap,
                              title: 'Submit',
                              //   widget: const Text('Submit')
                              //       .fontSize(16)
                              //       .bold(FontWeight.w600)
                              //       .color(AppColors.white),
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
    controller.forgetPasswordEmail(_formKey).then((response) {
      if (controller.loginModel.success == false) {
        Util.displayErrorToast(
          context,
          controller.loginModel.message.toString(),
        );
      } else {
        SnackBarService.showInfoSnackBar(
          controller.loginModel.message.toString(),
        );

        Get.toNamed(Routes.otpVerification);
      }
    });
  }
}
