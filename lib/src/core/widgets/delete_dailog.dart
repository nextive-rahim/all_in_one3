import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

 deleteDailog({
  required BuildContext context,
  required String message,
  required Function onTap,
  String? title,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? 'Do you want delete this job?',
              style: TextStyle(
                color: Color(0xFF363636),
                fontSize: 18,

                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 15),
            Divider(),
            Text(
              message,
              style: TextStyle(
                color: Color(0xFF8A8A8A),
                fontSize: 12,

                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 25),
            PrimaryButton(onTap: onTap, title: 'Yes, Delete'),
            SizedBox(height: 12),
            PrimaryButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              widget: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // height: 1.56,
                ),
              ),

              backgroundColor: AppColors.transparent,
            ),
          ],
        ),
      );
    },
  );
}
