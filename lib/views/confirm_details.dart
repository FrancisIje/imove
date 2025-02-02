import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/utiils/colors.dart';
import 'package:imove/utiils/textstyle.dart';
import 'package:imove/view_models/basedelivery_viewmodel.dart';
import 'package:imove/view_models/instant_delivery_viewmodel.dart';
import 'package:imove/view_models/schedule_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ConfirmDetailsScreen extends StatelessWidget {
  final String type;
  const ConfirmDetailsScreen({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    late final viewModel;
    if (type == "instant") {
      viewModel = Provider.of<InstantDeliveryViewModel>(context);
    } else {
      viewModel = Provider.of<ScheduleDeliveryViewModel>(context);
    }
    final String category = viewModel.category ?? "";
    final int quantity = int.tryParse(viewModel.controllers[4].text) ?? 0;
    final String payer = viewModel.payer ?? "Me";
    final String recipientName = viewModel.controllers[2].text;
    final String recipientNumber = viewModel.controllers[3].text;
    final String senderAddress = viewModel.controllers[0].text;
    final String receiverAddress = viewModel.controllers[1].text;
    final String deliveryDate =
        DateFormat.yMMMMEEEEd().format(viewModel.deliveryDate);
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images/location.png",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AspectRatio(
              aspectRatio: 0.72,
              child: Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Details",
                      style: AppTypography.avenir().h6,
                    ),
                    Gap(8.h),
                    Text(
                      "Please confirm the details below",
                      style: AppTypography.avenir().bodySmallM.copyWith(
                            color: Colors.black45,
                          ),
                    ),
                    Gap(16.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              const Icon(Icons.pin_drop_outlined),
                              Gap(8.h),
                              Container(
                                height: 7,
                                width: 7,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                              Gap(8.h),
                              Container(
                                height: 7,
                                width: 7,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                              Gap(8.h),
                              Container(
                                height: 7,
                                width: 7,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                              Gap(8.h),
                              Container(
                                height: 7,
                                width: 7,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green),
                              ),
                              Gap(8.h),
                              Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.green, width: 3),
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Gap(16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pickup Location",
                              style: AppTypography.avenir()
                                  .captionR
                                  .copyWith(color: Colors.black45),
                            ),
                            Gap(4.h),
                            Text(
                              senderAddress,
                              style: AppTypography.avenir().bodySmallSB,
                            ),
                            Gap(24.h),
                            Text(
                              "Delivery Location",
                              style: AppTypography.avenir()
                                  .captionR
                                  .copyWith(color: Colors.black45),
                            ),
                            Text(
                              receiverAddress,
                              style: AppTypography.avenir().bodySmallSB,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(16.h),
                    _DetailRow(label: "Category", value: category),
                    Gap(8.h),
                    _DetailRow(label: "Quantity", value: "$quantity"),
                    Gap(8.h),
                    _DetailRow(label: "Payer", value: payer),
                    Gap(8.h),
                    _DetailRow(label: "Recipient Name", value: recipientName),
                    Gap(8.h),
                    _DetailRow(
                        label: "Recipient Number", value: recipientNumber),
                    Gap(8.h),
                    _DetailRow(label: "Fee", value: "N2000"),
                    Gap(8.h),
                    _DetailRow(label: "Delivery Date", value: deliveryDate),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () async {
                        final isOrderPlaced = await context
                            .read<InstantDeliveryViewModel>()
                            .placeOrder(deliveryDate: DateTime.now());
                        if (isOrderPlaced) {
                          context.go("/courier/instant");
                        }
                      },
                      child: const Text("Confirm and Proceed"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: AppTypography.avenir().bodySmallM.copyWith(
                  color: Colors.black45,
                ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: AppTypography.avenir().bodyMediumSB,
          ),
        ),
      ],
    );
  }
}
