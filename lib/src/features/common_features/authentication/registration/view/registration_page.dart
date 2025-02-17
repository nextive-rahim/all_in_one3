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
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/common_features/authentication/registration/controller/registration_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/authentication/root/widgets/registration_header.dart';
import 'package:all_in_one3/src/features/common_features/authentication/root/widgets/selected_skills.dart';
import 'package:all_in_one3/src/features/common_features/skill/controller/skill_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'dart:io' show Platform;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final controller = Get.find<RegistrationViewController>();
  final skillController = Get.find<SkillViewController>();
  @override
  void initState() {
    // skillController.getSkills();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('User Type : ${Get.arguments}');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RegistrationHeader(title: 'Fill the fields'),

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
                      padding: const EdgeInsets.all(16.0),
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
                            labelText: AppStrings.name,
                            controller: controller.nameController,
                            hintText: AppStrings.nameHint,
                            validator: InputFieldValidator.name(),
                          ),
                          OutlinedInputField(
                            labelText: AppStrings.phoneNumber,
                            controller: controller.phoneNumberController,
                            hintText: AppStrings.phoneNumberHint,
                            keyboardType: TextInputType.phone,
                          ),
                          Get.arguments == 3
                              ? const Offstage()
                              : SelectedSkills(),
                          10.sh,
                          OutlinedInputField(
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
                            controller: controller.confirmPasswordController,
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
                          const SizedBox(height: 20),
                          Obx(
                            () => PrimaryButton(
                              isLoading:
                                  controller.pageState == PageState.loading,
                              onTap: onTap,
                              title: AppStrings.createMyAccount,
                            ),
                          ),
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
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTap() {
    controller.registration(_formKey, Get.arguments).then((value) {
      if (controller.selectedSkillIdList.isEmpty) {
        SnackBarService.showErrorSnackBar('Please Select Skills');

        return;
      }

      if (controller.signupModel!.success == false) {
        SnackBarService.showErrorSnackBar(AppStrings.registrationFailedMessage);
      } else {
        SnackBarService.showInfoSnackBar(AppStrings.registrationFailedMessage);

        Get.offNamed(Routes.registrationCompleted);
      }
    });
  }

 
}
