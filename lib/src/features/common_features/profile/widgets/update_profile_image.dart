import 'dart:io';

import 'package:all_in_one3/src/core/service/file/file_service.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_update_view_controller.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileImageSecton extends GetView<UpdateProfileiewController> {
  const UpdateProfileImageSecton({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.find<ProfileViewController>();
    print(profileController.userModel?.image);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 96,
        width: 96,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4FA),
          borderRadius: BorderRadius.circular(500),
        ),
        child: GestureDetector(
          onTap: () async {
            await FileService().pickAFile().then((value) {
              controller.fileImagelink.value = value!.path;
              controller.uploadFile(value.file).then((value2) {
                controller.imagelink.value = value2;
              });
              return;
            });
          },
          child: Column(
            children: [
              Obx(
                () => Stack(
                  children: [
                    controller.fileImagelink.value != ''
                        ? SizedBox(
                          height: 76,
                          width: 76,
                          child: Image.file(
                            File(controller.fileImagelink.value),
                            fit: BoxFit.cover,
                          ),
                        )
                        : SizedBox(
                          height: 76,
                          width: 76,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              'https://nextivesolution.sgp1.cdn.digitaloceanspaces.com/static/not-found.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    Positioned(
                      bottom: 50,
                      right: 0,

                      top: 50,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: CommonColor.purpleColor1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
