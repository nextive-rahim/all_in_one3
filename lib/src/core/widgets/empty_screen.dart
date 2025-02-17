import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    this.onTap,
    this.title,
  });
  final void Function()? onTap;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
        top: 20,
        bottom: 60,
      ),
      child: SizedBox(
        height: SizeConfig.screenHeight * 0.59,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // alignment: Alignment.center,
          // fit: StackFit.expand,
          //  fit: StackFit.loose,
          children: [
            SizedBox(
              width: SizeConfig.screenWidth,
              child: Image.asset(
                ImageConstant.emptyCourse,
                fit: BoxFit.fill,
                height: 304,
                width: 304,
              ),
            ),
            const TextWidget(
                textAlign: TextAlign.center,
                text: AppStrings.coursesUnavailable,
                color: CommonColor.blackColor1,
                maxLine: 1,
                fontFamily: AppStrings.sfProDisplay,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageConstant.refresh),
                  const SizedBox(
                    width: 16,
                  ),
                  const TextWidget(
                      textAlign: TextAlign.center,
                      text: AppStrings.refresh,
                      color: CommonColor.greyColor11,
                      maxLine: 1,
                      fontFamily: AppStrings.sfProDisplay,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
