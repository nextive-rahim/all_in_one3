import 'package:all_in_one3/src/core/service/file/file_service.dart';
import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/validators/input_form_validators.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/widgets/skill_update_section.dart';
import 'package:all_in_one3/src/features/company_module/mobile/manage_and_add_courses_employees/add_employee/controller/added_new_employee_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddedNewEmployeeFormField
    extends GetView<AddedNewEmployeeViewController> {
  const AddedNewEmployeeFormField({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateProfileiewController());
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          OutlinedInputField(
            labelText: 'Employee Id*',
            controller: controller.employeeController,
            hintText: '123456',
            validator: InputFieldValidator.name(),
            keyboardType: TextInputType.number,
          ),
          OutlinedInputField(
            labelText: 'Name*',
            controller: controller.nameController,
            hintText: AppStrings.nameHint,
            validator: InputFieldValidator.name(),
          ),
          OutlinedInputField(
            labelText: 'On site email address',
            controller: controller.emailController,
            hintText: 'example@gmail.com',
            validator: InputFieldValidator.email(),
          ),
          OutlinedInputField(
            labelText: 'Contact no.',
            controller: controller.contactsNumberController,
            hintText: 'Enter your contact number',
            validator: InputFieldValidator.name(),
            keyboardType: TextInputType.number,
          ),
          OutlinedInputField(
            labelText: 'Degination',
            controller: controller.contactsNumberController,
            hintText: 'Enter your degination',
            validator: InputFieldValidator.name(),
            keyboardType: TextInputType.number,
          ),

          SkillUpdateSection(),
          labelText('Upload Resume'),
          TextFormFieldWidget(
            isEmailField: true,
            controller: controller.uploadResumeController,
            valtext: AppStrings.commonTextVal,
            height: 45,
            hintText: 'Only PDF',
            readOnly: false,
            maxLine: 1,
            keyType: TextInputType.text,
            wordLimit: 100,
            fontFamily: AppStrings.inter,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            onChanged: (value) {
              String link = value.split('/').last;
              controller.uploadResumeController.text = link;
            },
            suffixIcon: Obx(
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
          labelText(' Description'),
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

  Widget labelText(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 20),
      child: Title(color: AppColors.black, child: Text(title)),
    );
  }
}
