import 'package:all_in_one3/src/core/utils/assets.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/text_form_field.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/common_features/profile/controller/profile_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/course_details/comment/controller/view_comment_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/course_details/comment/controller/write_comment_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/course_details/comment/model/student_view_comment_model.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteComment extends GetView<WriteCommentViewController> {
  const WriteComment({super.key, required this.collectinListData});
  final CourseModel collectinListData;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            AppStrings.courseDiscussionForum,
            style: TextStyle(
              color: Color(0xFF5A5959),
              fontSize: 16,

              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          GestureDetector(
            onTap: () {
              controller.writeComment.value = !controller.writeComment.value;
            },
            child: Container(
              width: 322,
              height: 58,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFE9E9E9)),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Container(
                width: 163.97,
                height: 36,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Image.asset(Assets.add, color: Color(0xFFADADAD)),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Write a message',
                      style: TextStyle(
                        color: Color(0xFFADADAD),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1.43,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 00),
          Visibility(
            visible: controller.writeComment.value,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Column(
                children: [
                  SizedBox(
                    // height: 281,
                    width: SizeConfig.screenWidth,

                    child: TextFormFieldWidget(
                      controller: controller.writeCommentTextController,
                      valtext: AppStrings.commonTextVal,
                      height: 45,
                      hintText: "Wirte a post ....",
                      readOnly: false,
                      maxLine: 7,
                      keyType: TextInputType.text,
                      wordLimit: 300,
                      fontFamily: AppStrings.inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.writeComment.value = false;
                          //controller.disable();
                        },
                        child: Container(
                          width: 120,
                          height: 44,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: CommonColor.whiteColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.50,
                                color: CommonColor.greyColor5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const TextWidget(
                            text: AppStrings.cancel,
                            color: CommonColor.blackColor4,
                            maxLine: 1,
                            fontFamily: AppStrings.inter,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      GestureDetector(
                        onTap: () {
                          if (controller
                              .writeCommentTextController
                              .text
                              .isNotEmpty) {
                            controller
                                .writeComments(
                                  collectinListData.id!,
                                  controller.writeCommentTextController.text,
                                )
                                .then((value) {
                                  Get.find<ViewCommentViewController>()
                                      .addNewComment(
                                        (ViewCommentResponseData(
                                          updatedAt: DateTime.now(),
                                          username:
                                              Get.find<ProfileViewController>()
                                                  .userModel
                                                  ?.name ??
                                              '',
                                          commentText:
                                              controller
                                                  .writeCommentTextController
                                                  .text,
                                        )),
                                      );

                                  controller.writeCommentTextController.text =
                                      '';
                                });
                          } else {
                            SnackBarService.showErrorSnackBar(
                              "Please make a comment",
                            );
                          }
                        },
                        child: Container(
                          width: 120,
                          height: 44,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: CommonColor.blueColor1,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 0.50,
                                color: CommonColor.blueColor1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const TextWidget(
                            text: AppStrings.postNow,
                            color: CommonColor.whiteColor,
                            maxLine: 1,
                            fontFamily: AppStrings.inter,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
