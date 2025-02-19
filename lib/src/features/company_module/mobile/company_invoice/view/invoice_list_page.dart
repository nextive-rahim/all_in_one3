import 'package:all_in_one3/src/core/extension/string_extension.dart';
import 'package:all_in_one3/src/core/page_state/state.dart';
import 'package:all_in_one3/src/core/routes/app_pages.dart';
import 'package:all_in_one3/src/features/company_module/mobile/company_invoice/controller/company_invoice_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceListPage extends GetView<CompanyInvoiceViewController> {
  const InvoiceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.pageState == PageState.loading) {
        return const CircularProgressIndicator();
      }
      return ListView.builder(
        itemCount: controller.invoice.length,
        shrinkWrap: true,
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              controller.invoiceLink(controller.invoice[index].id!).then((
                v,
              ) async {
                Get.toNamed(Routes.companyInvoicePage, arguments: v.url);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 20,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.invoice[index].name ?? '',
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 22,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            getFormattedDateTime(
                              controller.invoice[index].createdAt,
                            )!,
                            style: TextStyle(
                              color: Color(0xFF262626),
                              fontSize: 16,

                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
