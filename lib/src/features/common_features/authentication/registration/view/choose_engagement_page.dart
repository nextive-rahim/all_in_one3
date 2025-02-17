import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:all_in_one3/src/core/utils/image_constant.dart';
import 'package:all_in_one3/src/core/utils/size_config.dart';
import 'package:all_in_one3/src/core/utils/strings.dart';
import 'package:all_in_one3/src/core/utils/util.dart';
import 'package:all_in_one3/src/core/widgets/primary_button.dart';
import 'package:all_in_one3/src/core/widgets/text_widget.dart';
import 'package:all_in_one3/src/features/common_features/authentication/root/widgets/registration_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseEngagementPage extends StatefulWidget {
  const ChooseEngagementPage({super.key});

  @override
  State<ChooseEngagementPage> createState() => _ChooseEngagementPageState();
}

class _ChooseEngagementPageState extends State<ChooseEngagementPage> {
  int? _selectedIndex;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Choose Engagement'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegistrationHeader(title: 'Choose Engagement'),

                ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, ind) {
                    return const SizedBox(height: 8);
                  },
                  itemBuilder: (context, index) {
                    return index == 1 ? const Offstage() : _buildItem(index);
                  },
                ),
                const SizedBox(height: 18),
                PrimaryButton(
                  backgroundColor:
                      _selectedIndex != null
                          ? CommonColor.purpleColor1
                          : Colors.black.withValues(alpha: .1),
                  onTap: () {
                    if (_selectedIndex != null) {
                      Get.toNamed(
                        Routes.registration,
                        arguments: (_selectedIndex! + 1).toString(),
                      );
                    } else {
                      Util.displayErrorToast(
                        context,
                        AppStrings.chooseEngagementMsg,
                      );
                    }
                  },
                  title: AppStrings.continueTxt,
                ),
                const SizedBox(height: 41),
                Container(
                  width: SizeConfig.screenWidth,
                  height: 1,
                  color: CommonColor.backgroundColor2,
                ),
                const SizedBox(height: 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CommonColor.headingTextColor1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const TextWidget(
                          text: AppStrings.termsOfUse,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CommonColor.headingTextColor1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const TextWidget(
                          text: AppStrings.dataCollectionRights,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 3,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: CommonColor.headingTextColor1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const TextWidget(
                          text: AppStrings.privacyAndPolicy,
                          color: CommonColor.headingTextColor1,
                          maxLine: 1,
                          fontFamily: AppStrings.aeonikTRIAL,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const TextWidget(
                  text: AppStrings.appVersion,
                  color: CommonColor.lightGreyForText1,
                  maxLine: 1,
                  fontFamily: AppStrings.aeonikTRIAL,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
                const SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onItemCheckedChange(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  Widget _buildItem(int index) {
    return GestureDetector(
      onTap: () {
        _onItemCheckedChange(index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color:
                _selectedIndex == index
                    ? CommonColor.purpleColor1
                    : CommonColor.borderColor1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: CommonColor.whiteColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
                width: 32,
                child: Image.asset(
                  index == 0
                      ? ImageConstant.studenIcom
                      : index == 2
                      ? ImageConstant.comnpanyIcon
                      : index == 3
                      ? ImageConstant.interviewerIcon
                      : '',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text:
                              AppStrings.chooseEngagementContetTitles[index]
                                  .split(' ')
                                  .first,
                          color:
                              _selectedIndex == index
                                  ? Color(0xFF0065FF)
                                  : Color(0xFF667084),
                          maxLine: 1,
                          fontFamily: AppStrings.inter,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        _selectedIndex == index
                            ? SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(ImageConstant.selectedCheck),
                            )
                            : Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: CommonColor.textFieldBorderColor,
                                ),
                                borderRadius: BorderRadius.circular(100),
                                color: CommonColor.whiteColor,
                              ),
                              alignment: Alignment.center,
                            ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Includes up to 10 users, 20GB indiviual data and access to all features.',
                      style: TextStyle(
                        color:
                            _selectedIndex == index
                                ? Color(0xFF0065FF)
                                : Color(0xFF667084),
                        fontSize: 14,

                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
