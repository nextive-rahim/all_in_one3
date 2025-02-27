part of '../view/generate_invoice_page.dart';

class GenerateInvoice extends GetView<CompanyInvoiceViewController> {
  const GenerateInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          getFormattedDate(DateTime.now())!,
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 24,

            fontWeight: FontWeight.w400,
          ),
        ),

        15.sh,
        Container(
          width: 326,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Color(0xFFE9F2F3),
              ),
            ),
          ),
        ),
        15.sh,
        const Text(
          'Generated Monthly Invoice',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        20.sh,
        Text(
          'Name of the Employee',
          style: AppTextStyle.medium14.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 6),
        Obx(() {
          final employeControler =
              Get.find<CompanyEmployeeListViewController>();
          return CommonPopupMenu(
            onSelected: (String value) {
              controller.selectedEmployeeName.value = value;
            },
            data:
                employeControler.employeeList.map((e) => e.name ?? '').toList(),
            selectedValue: controller.selectedEmployeeName.value,
          );
        }),
        10.sh,
        Form(
          key: controller.formKey,
          child: Column(
            children: [
              OutlinedInputField(
                labelText: 'Hours',
                controller: controller.hourController,
                hintText: 'No. of working hours',
                validator: InputFieldValidator.name(),
                keyboardType: TextInputType.number,
              ),
              OutlinedInputField(
                labelText: 'Days',
                controller: controller.daysController,
                hintText: 'No. of working days',
                validator: InputFieldValidator.name(),
                keyboardType: TextInputType.number,
              ),
              OutlinedInputField(
                labelText: 'Amount',
                controller: controller.amountController,
                hintText: 'Total amount',
                validator: InputFieldValidator.name(),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 15),
              const _GenerateInvoiceButton(),
            ],
          ),
        ),
        20.sh,
      ],
    );
  }
}
