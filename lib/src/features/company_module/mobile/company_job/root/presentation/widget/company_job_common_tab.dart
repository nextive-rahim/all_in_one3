import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CompanyJobCommonTabSection extends StatefulWidget {
  const CompanyJobCommonTabSection({
    super.key,
    required this.firstTabViewItems,
    required this.secondTabViewItems,
    required this.thirdTabViewItems,
    required this.fourthTabViewItems,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  });
  final List<Widget> firstTabViewItems;
  final List<Widget> secondTabViewItems;
  final List<Widget> thirdTabViewItems;
  final List<Widget> fourthTabViewItems;
  final String? title1;
  final String? title2;
  final String? title3;
  final String? title4;
  @override
  State<CompanyJobCommonTabSection> createState() =>
      _CompanyJobCommonTabSectionState();
}

class _CompanyJobCommonTabSectionState extends State<CompanyJobCommonTabSection>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TabBar(
              dividerColor: CommonColor.greyColor15,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  if (selectedIndex == 1) {
                    // ref
                    //     .read(selectedSecoundTabProvider.notifier)
                    //     .update((state) => true);
                  } else {
                    // ref
                    //     .read(selectedSecoundTabProvider.notifier)
                    //     .update((state) => false);
                  }
                  tabController?.animateTo(index);
                });
              },
              controller: tabController,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              // indicatorWeight: 100,
              indicatorSize: TabBarIndicatorSize.tab,
              padding: EdgeInsets.zero,
              indicatorPadding: const EdgeInsets.only(
                top: 46,
                left: 0,
                right: 30,
              ),

              labelColor: CommonColor.purpleColor1,
              unselectedLabelColor: Color(0xFF585858),
              labelPadding: const EdgeInsets.only(left: 0, right: 35),
              unselectedLabelStyle: const TextStyle(
                color: Color(0xFF585858),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
              labelStyle: const TextStyle(
                color: Color(0xFF585858),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
              indicator: BoxDecoration(
                color: CommonColor.purpleColor1,
                borderRadius: BorderRadius.circular(4),
              ),
              tabs: [
                Tab(
                  child: Text(
                    widget.title1 ?? '',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    widget.title2 ?? '',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    widget.title3 ?? '',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    widget.title4 ?? '',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            Visibility(
              visible: selectedIndex == 0,
              maintainState: true,
              maintainAnimation: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.firstTabViewItems,
              ),
            ),
            Visibility(
              visible: selectedIndex == 1,
              maintainState: true,
              maintainAnimation: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.secondTabViewItems,
              ),
            ),
            Visibility(
              visible: selectedIndex == 2,
              maintainState: true,
              maintainAnimation: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.thirdTabViewItems,
              ),
            ),
            Visibility(
              visible: selectedIndex == 3,
              maintainState: true,
              maintainAnimation: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.fourthTabViewItems,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
