import 'package:all_in_one3/src/core/service/file/file_service.dart';
import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/widgets/skill_update_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileForm extends GetView<UpdateProfileiewController> {
  const UpdateProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          OutlinedInputField(
            labelText: 'Name',
            controller: controller.nameController,
            hintText: AppStrings.hitTextUsername,
            validator: InputFieldValidator.name(),
          ),
          OutlinedInputField(
            labelText: 'Contact no.',
            controller: controller.contactsNumberController,
            hintText: AppStrings.hitTextUsername,
            validator: InputFieldValidator.name(),
            keyboardType: TextInputType.number,
          ),
          OutlinedInputField(
            labelText: 'Address',
            controller: controller.addressController,
            hintText: AppStrings.hitTextUsername,
            validator: InputFieldValidator.name(),
          ),

          SkillUpdateSection(),
          SizedBox(height: 20),
          OutlinedInputField(
            labelText: 'Upload Resume',
            controller: controller.uploadResumeController,

            hintText: 'Only PDF',
            readOnly: false,

            onChanged: (value) {
              String link = value.split('/').last;
              controller.uploadResumeController.text = link;
            },
            suffix: Obx(
              () => IconButton(
                onPressed: () async {
                  await FileService().pickAFile(pdfOnly: true).then((value) {
                    if (value == null) {
                      return;
                    }
                    if (value.file.path.isNotEmpty) {
                      controller.isUploadFile.value = true;
                    }

                    Get.put(
                      UpdateProfileiewController(),
                    ).uploadFile(value.file).then((value2) {
                      controller.resumeLink.value = value2;
                      controller.uploadResumeController.text =
                          controller.resumeLink.value;
                      controller.isUploadFile.value = false;
                    });

                    return;
                  });

                  // await FileService()
                  //     .pickAFile(pdfOnly: true)
                  //     .then((value) async {
                  //   controller.isUploadFile.value = true;
                  //   await controller.uploadFile(value!.file).then((value2) {
                  //     controller.resumeLink.value = value2;
                  //     controller.uploadResumeController.text =
                  //         controller.resumeLink.value;
                  //   });
                  //   controller.isUploadFile.value = false;
                  //   return;
                  // });
                },
                icon:
                    controller.isUploadFile.value
                        ? const SizedBox(
                          height: 13,
                          width: 13,
                          child: CircularProgressIndicator(),
                        )
                        : const Icon(Icons.upload, color: Color(0xFF667084)),
              ),
            ),
          ),
          labelText(' Description', top: 0),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.employeeDescriptionController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Write about  Yourself',
            readOnly: false,
            maxLine: 5,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget labelText(String title, {double? top}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: top ?? 20),
      child: Title(
        color: AppColors.black,
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF344053),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.43,
          ),
        ),
      ),
    );
  }
}
