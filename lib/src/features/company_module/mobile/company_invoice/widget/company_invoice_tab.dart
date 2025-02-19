import 'package:all_in_one3/src/core/theme/colors.dart';
import 'package:all_in_one3/src/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CompanyInvoiceTabSection extends StatefulWidget {
  const CompanyInvoiceTabSection({
    super.key,
    required this.firstTabViewItems,
    required this.secondTabViewItems,
    required this.title1,
    required this.title2,
  });
  final List<Widget> firstTabViewItems;
  final List<Widget> secondTabViewItems;
  final String? title1;
  final String? title2;
  @override
  State<CompanyInvoiceTabSection> createState() =>
      _CompanyInvoiceTabSectionState();
}

class _CompanyInvoiceTabSectionState extends State<CompanyInvoiceTabSection>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      initialIndex: selectedIndex,
      length: 2,
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
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TabBar(
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
              isScrollable: false,
              indicatorWeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.only(
                top: 47,
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 00, vertical: 0),
              labelColor: CommonColor.purpleColor1,
              unselectedLabelColor: Colors.black,
              labelPadding: const EdgeInsets.only(left: 5, right: 5),
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
          ],
        ),
      ],
    );
  }
}
