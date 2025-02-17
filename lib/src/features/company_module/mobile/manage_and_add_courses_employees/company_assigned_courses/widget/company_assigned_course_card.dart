import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/text_style.dart';
import 'package:all_in_one3/src/features/student_module/mobile/course/home_course/model/student_home_model.dart';
import 'package:flutter/material.dart';

class CompanyAssingnedCoursesCard extends StatelessWidget {
  const CompanyAssingnedCoursesCard({
    super.key,
    required this.course,
    this.isSelectItem = false,
    required this.onTap,
  });
  final CourseModel? course;
  final bool isSelectItem;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Name :  ", style: AppTextStyle.bold14),
          Text(course?.title ?? '', style: AppTextStyle.bold16),
        ],
      ),
      subtitle: Wrap(
        children: [
          const Text("ID  :   ", style: AppTextStyle.bold14),
          Text(course?.id.toString() ?? '', style: AppTextStyle.bold16),
        ],
      ),
      trailing: Column(
        children: [
          const Text("Level  :   ", style: AppTextStyle.bold14),
          Text(
            course?.coursesLevel.toString() ?? '',
            style: AppTextStyle.bold13.copyWith(color: CommonColor.greyColor),
          ),
        ],
      ),
      leading: _mainUI(isSelectItem),
    );
  }

  Widget _mainUI(bool isSelected) {
    return Icon(
      isSelected ? Icons.check_box : Icons.check_box_outline_blank,
      color: AppColors.deepBlue,
    );
  }
}
