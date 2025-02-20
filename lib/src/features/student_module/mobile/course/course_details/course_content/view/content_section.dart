import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/course_details/course_content/controller/student_course_content_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/course_details/course_content/widget/content_title_builder.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseContent extends GetView<StudentCourseContentViewController> {
  const CourseContent({super.key, this.courseModel});
  final CourseModel? courseModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: SizeConfig.screenWidth,
          height: 1,
          color: CommonColor.greyColor5,
        ),
        // const SizedBox(height: 35),
        Text(
          "Course   : ${courseModel?.title ?? ''}",
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 16,

            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "Duration : ${courseModel?.totalTime ?? ''}",
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 16,

            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.only(top: 20, bottom: 10),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                if (controller.pageState == PageState.loading) {
                  return const Offstage();
                }
                return ContentTileBuilder(
                  contentList: controller.contentTileList,
                );
              }),

              const TextWidget(
                text: AppStrings.endOfYourCourse,
                color: CommonColor.greyColor7,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
