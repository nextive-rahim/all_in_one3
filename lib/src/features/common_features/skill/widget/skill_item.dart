import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/features/common_features/skill/model/skills_model.dart';
import 'package:flutter/material.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({
    super.key,
    required this.course,
    this.isSelectItem = false,
    required this.onTap,
  });
  final SkillsModel? course;
  final bool isSelectItem;
  final void Function()? onTap;
  @override
  State<SkillCard> createState() => SkillCardState();
}

class SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.course?.skill ?? '',
           style: TextStyle(
              color: Color(0xFF262626),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      leading: _mainUI(widget.isSelectItem),
    );
  }

  Widget _mainUI(bool isSelected) {
    return Icon(
      isSelected ? Icons.check_box : Icons.check_box_outline_blank,
      color: AppColors.primary,
    );
  }
}
