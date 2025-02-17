import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/features/common_features/authentication/forget_password/controller/otp_verification_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/authentication/root/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPverificationPage extends StatefulWidget {
  const OTPverificationPage({super.key});

  @override
  State<OTPverificationPage> createState() => OTPverificationPageState();
}

class OTPverificationPageState extends State<OTPverificationPage> {
  final controller = Get.find<OtpVerificationViewController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Verify OTP'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthHeader(
                    title: 'Enter Your OTP',
                    subtitle: 'Enter otp to verify email',
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
                            labelText: 'OTP',
                            controller: controller.otpController,
                            hintText: 'Enter your otp',
                            validator: InputFieldValidator.email(),
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => PrimaryButton(
                              isLoading:
                                  controller.pageState == PageState.loading,
                              onTap: onTap,
                              title: 'Submit',
                            ),
                          ),
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
    controller.otpverification(_formKey).then((response) {
      if (controller.loginModel.success == false) {
        SnackBarService.showErrorSnackBar(
          controller.loginModel.message.toString(),
        );
      } else {
        SnackBarService.showInfoSnackBar(
          controller.loginModel.message.toString(),
        );

        Get.toNamed(Routes.forgotPassword);
      }
    });
  }
}
