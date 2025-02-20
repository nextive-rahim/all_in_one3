import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/widget/course_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWiseCourseBuilder extends StatelessWidget {
  const CategoryWiseCourseBuilder({super.key, required this.courseList});
  final List<CourseModel> courseList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      itemCount: courseList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        CourseModel course = courseList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
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
            child: CourseCard(
              onTap: () {
                Get.toNamed(Routes.courseDetailMobilePage, arguments: course);
              },
              course: course,
            ),
          ),
        );
      },
    );
  }
}
