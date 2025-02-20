import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/widgets/custom_app_bar.dart';
import 'package:all_in_one3/src/core/widgets/empty_screen.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/controller/student_home_view_controller.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/widget/category_wise_course_builder.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/widget/course_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWiseCoursePage extends StatefulWidget {
  const CategoryWiseCoursePage({super.key});

  @override
  State<CategoryWiseCoursePage> createState() => _CategoryWiseCoursePageState();
}

class _CategoryWiseCoursePageState extends State<CategoryWiseCoursePage> {
  final studentDashboardController = Get.find<StudentHomeViewController>();
  //final List<CourseCard> courseList=Get.arguments;
  final String title = Get.arguments[1];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      studentDashboardController.categoryWiseCourse.value = Get.arguments[0];
      //studentDashboardController.getStudentHomeData();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: ''),
      resizeToAvoidBottomInset: false,
      // backgroundColor: CommonColor.greyColor1,
      body: RefreshIndicator(
        onRefresh: () async {
          studentDashboardController.getStudentHomeData();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              // top: 30,
              bottom: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF262626),
                    fontSize: 24,

                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() {
                  if (studentDashboardController.pageState ==
                      PageState.loading) {
                    return const CourseCardLoading();
                  }
                  if (studentDashboardController.categoryWiseCourse.isEmpty) {
                    return const EmptyScreen();
                  }
                  if (studentDashboardController.searchCourse.isNotEmpty) {
                    return CategoryWiseCourseBuilder(
                      courseList: studentDashboardController.searchCourse,
                      // onLogout: widget.onLogout,
                    );
                  } else {
                    return CategoryWiseCourseBuilder(
                      courseList: studentDashboardController.categoryWiseCourse,
                      // onLogout: widget.onLogout,
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
