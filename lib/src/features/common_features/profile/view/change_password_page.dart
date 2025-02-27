import 'package:all_in_one3/src/core/extension/sizebox_extension.dart';
import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/custom_app_bar.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/change_password_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final controller = Get.find<ChangePasswordViewController>();
  final _formKey = GlobalKey<FormState>();

  bool hintUsernameHelperText = false, hintPasswordHelperText = false;
  @override
  void initState() {
    // _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColor.whiteColor,
      appBar: CustomAppBar(title: ''),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 30),
                _headerNotMounted(),
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
                          isPasswordField: true,
                          labelText: AppStrings.oldPassword,
                          controller: controller.oldPasswordController,
                          hintText: AppStrings.oldPasswordHint,
                          validator: InputFieldValidator.password(),
                        ),
                        OutlinedInputField(
                          isPasswordField: true,
                          labelText: AppStrings.newPassword,
                          controller: controller.newPasswordController,
                          hintText: AppStrings.newPasswordHint,
                          validator: InputFieldValidator.password(),
                          onChanged: (v) {
                            if (v.isEmpty || v.length >= 6) {
                              setState(() {});
                            }
                          },
                        ),
                        10.sh,
                        const SizedBox(height: 30),
                        Obx(
                          () => PrimaryButton(
                            isLoading:
                                controller.pageState == PageState.loading,
                            onTap: onTap,
                            title: 'Change Password',
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerNotMounted() {
    return Column(
      children: [
        Container(
          width: SizeConfig.screenWidth,
          alignment: Alignment.center,
          child: Image.asset(
            Assets.appLogo,
            height: 75,
            width: 75,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 7),
        const TextWidget(
          text: 'Change Your Password',
          color: CommonColor.headingTextColor1,
          maxLine: 1,
          fontFamily: AppStrings.aeonikTRIAL,
          fontWeight: FontWeight.w700,
          fontSize: 28,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void onTap() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    controller.changePassword(_formKey).then((response) {
      if (controller.loginModel.message == 'Password Change Successfully.') {
        Get.back();
        SnackBarService.showInfoSnackBar(
          controller.loginModel.message.toString(),
        );

        return;
      }
    });
  }
}
