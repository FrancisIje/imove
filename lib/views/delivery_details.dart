import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/utiils/textstyle.dart';
import 'package:imove/utiils/utils.dart';

class DeliveryDetailsScreen extends StatelessWidget {
  const DeliveryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(Icons.arrow_back_ios_new)),
                  Gap(16.w),
                  Text(
                    "Delivery details",
                    style: AppTypography.avenir().bodyLargeSB,
                  ),
                ],
              ),
              Gap(24.h),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: CachedNetworkImageProvider(
                        "https://images.unsplash.com/photo-1522529599102-193c0d76b5b6?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmxhY2slMjBtYWxlfGVufDB8fDB8fHww"),
                  ),
                  Gap(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Gap(8),
                      Text(
                        "John Doe",
                        style: AppTypography.avenir().bodySmallSB,
                      ),
                      Text(
                        "44 Deliveries",
                        style: AppTypography.avenir().captionM,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: StarRating(
                          size: 16,
                          rating: 3.5,
                          allowHalfRating: true,
                          color: Colors.orangeAccent,
                          onRatingChanged: (rating) {
                            // return setState(() => this.rating = rating);
                          },
                        ),
                      ),
                    ],
                  ),
                  const Expanded(child: Gap(1)),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        color: Colors.green),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    child: Text(
                      "Completed",
                      style: AppTypography.avenir()
                          .bodySmallM
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Gap(24.h),
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
                              shape: BoxShape.circle, color: Colors.green),
                        ),
                        Gap(8.h),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                        ),
                        Gap(8.h),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                        ),
                        Gap(8.h),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                        ),
                        Gap(8.h),
                        Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.green, width: 3),
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
              Gap(32.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What are you sending?",
                        style: AppTypography.avenir()
                            .captionR
                            .copyWith(color: Colors.black45),
                      ),
                      Text(
                        "Electronics/Gadgets",
                        style: AppTypography.avenir().bodySmallSB,
                      ),
                    ],
                  ),
                  Expanded(child: Gap(32.w)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Receipient's Name",
                        style: AppTypography.avenir()
                            .captionR
                            .copyWith(color: Colors.black45),
                      ),
                      Text(
                        "John Doe",
                        style: AppTypography.avenir().bodySmallSB,
                      ),
                    ],
                  ),
                  Expanded(child: Gap(32.w)),
                ],
              ),
              Gap(16.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Receipient's Number",
                      style: AppTypography.avenir()
                          .captionR
                          .copyWith(color: Colors.black45),
                    ),
                    Text(
                      "08104204245",
                      style: AppTypography.avenir().bodySmallSB,
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment mode",
                        style: AppTypography.avenir()
                            .captionR
                            .copyWith(color: Colors.black45),
                      ),
                      Text(
                        "Cash",
                        style: AppTypography.avenir().bodySmallSB,
                      ),
                    ],
                  ),
                  Expanded(child: Gap(32.w)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fee",
                        style: AppTypography.avenir()
                            .captionR
                            .copyWith(color: Colors.black45),
                      ),
                      Text(
                        "N2000",
                        style: AppTypography.avenir().bodySmallSB,
                      ),
                    ],
                  ),
                  Expanded(child: Gap(32.w)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
