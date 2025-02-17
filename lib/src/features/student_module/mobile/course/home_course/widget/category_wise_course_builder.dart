import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one3/src/core/service/cache/cache_service.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/widget/course_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        return CourseCard(
          key: ValueKey(courseList[index].id),
          onTap: () {
            CacheService.boxAuth.write(CacheKeys.courseModel, course);
            context.pushNamed(Routes.courseDetailMobilePage);
            // Get.toNamed(
            //   Routes.courseDetailMobilePage,
            //   arguments: course,
            // );
          },
          course: course,
        );
      },
    );
  }
}
