import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/utiils/colors.dart';
import 'package:imove/utiils/textstyle.dart';

class ConfirmDetailsScreen extends StatelessWidget {
  const ConfirmDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String category = "Electronics";
    final int quantity = 5;
    final String payer = "Me";
    final String recipientName = "John Doe";
    final String recipientNumber = "08104204245";
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
              aspectRatio: 0.8,
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
                              "32 Samwell Sq, Chevron",
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
                              "21 Johnson Estate, Okota",
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
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        context.go("/courier");
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
