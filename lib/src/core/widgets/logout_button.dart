import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/delete_dailog.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        deleteDailog(
          yesText: 'Yes',
          context: context,
          title: 'Are you sure?',
          message:
              'Once logged out, you will need to login again to access this app.',
          onTap: () {
            Util.logout(context);
          },
        );
      },
      child: const Icon(Icons.logout_outlined, color: AppColors.red),
    );
  }
}
