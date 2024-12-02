import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:imove/models/delivery.dart';
import 'package:imove/utiils/utils.dart';

class TransactionWidget extends StatelessWidget {
  final DeliveryModel deliveryModel;

  const TransactionWidget({super.key, required this.deliveryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deliveryModel.id,
                  style: AppTypography.avenir().bodyMediumM,
                ),
                Gap(2.h),
                Text(
                  "Receipient: ${deliveryModel.receiverName} Doe",
                  style: AppTypography.avenir()
                      .captionM
                      .copyWith(color: const Color(0xFF545454)),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
              child: Text(
                "Completed",
                style: AppTypography.avenir()
                    .captionM
                    .copyWith(color: Colors.white),
              ),
            )
          ],
        ),
        Gap(16.h),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: AppColors.primaryColor.withOpacity(0.1),
              ),
              child: const ImageIcon(
                AssetImage(
                  "assets/icons/fast-delivery.png",
                ),
                color: AppColors.primaryColor,
              ),
            ),
            Gap(8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const ImageIcon(
                      AssetImage("assets/icons/pin.png"),
                      size: 12,
                      color: AppColors.primaryColor,
                    ),
                    Gap(4.w),
                    Text(
                      "Drop off",
                      style: AppTypography.avenir()
                          .captionR
                          .copyWith(color: const Color(0xFF545454)),
                    ),
                  ],
                ),
                Gap(4.h),
                Text(
                  "Maryland bustop, Anthony Ikeja",
                  style: AppTypography.avenir().bodySmallSB,
                ),
                Gap(4.h),
                Text(
                  "12 January 2020, 2:43pm",
                  style: AppTypography.avenir()
                      .captionM
                      .copyWith(color: const Color(0xFF545454)),
                )
              ],
            )
          ],
        ),
        Gap(8.h),
        const Divider(
          color: Color(0xFFDCE8E9),
        )
      ],
    );
  }
}
