import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CommonPopupMenu extends StatelessWidget {
  const CommonPopupMenu({
    super.key,
    required this.onSelected,
    required this.data,
    required this.selectedValue,
  });
  final void Function(String)? onSelected;
  final List<String> data;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.white,
      shadowColor: AppColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onSelected: onSelected,
      itemBuilder: (context) {
        return [
          for (var value in data)
            PopupMenuItem(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  color: Color(0xFF667084),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ];
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.blackColor4, width: .5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue!,
                style: const TextStyle(
                  color: Color(0xFF667084),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 25,
                color: Color(0xFF667084),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillCommonPopupMenu extends StatelessWidget {
  const SkillCommonPopupMenu({
    super.key,
    required this.onSelected,
    required this.data,
    required this.selectedValue,
  });
  final void Function(String)? onSelected;
  final List<String> data;
  final List<int>? selectedValue;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onSelected: onSelected,
      itemBuilder: (context) {
        return [
          for (var value in data)
            PopupMenuItem(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white)),
            ),
        ];
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CommonColor.blackColor4, width: .5),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                List.generate(
                  selectedValue!.length,
                  (int index) => selectedValue?[index],
                ).toString(),
                style: const TextStyle(color: CommonColor.blackColor),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded, size: 25),
            ],
          ),
        ),
      ),
    );
  }
}
