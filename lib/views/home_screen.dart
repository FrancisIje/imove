import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/models/delivery.dart';

import 'package:imove/utiils/utils.dart';
import 'package:imove/view_models/home_viewmodel.dart';
import 'package:imove/views/widgets/transaction_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeViewmodel>(context, listen: false).recentHistory();
    List<DeliveryModel> deliveries =
        Provider.of<HomeViewmodel>(context).lastThreeDeliveries;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(8.h),
                    Text(
                      "Welcome back",
                      style: AppTypography.avenir()
                          .bodyMediumM
                          .copyWith(color: const Color(0xFF4F4F4F)),
                    ),
                    Gap(8.h),
                    Consumer<HomeViewmodel>(
                      builder: (context, value, child) {
                        return Text(
                          // "Francis Ijenebe",
                          "${value.userViewModel.user.firstName.capitalize} ${value.userViewModel.user.lastName.capitalize}",
                          style: AppTypography.avenir()
                              .bodyLargeSB
                              .copyWith(color: const Color(0xFF111111)),
                        );
                      },
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const ImageIcon(
                        AssetImage("assets/icons/notification.png")),
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle),
                    ),
                  ],
                )
              ],
            ),
            Gap(4.h),
            const Divider(),
            Gap(16.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "What would you like to do?",
                style: AppTypography.avenir().bodyMediumR,
              ),
            ),
            Gap(8.h),
            AspectRatio(
              aspectRatio: 1.9,
              child: GestureDetector(
                onTap: () => context.push("/instant-delivery"),
                child: Stack(
                  // alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          color: AppColors.primaryColor.withOpacity(0.3)),
                    ),
                    Positioned(
                      right: -50.w,
                      child: ImageIcon(
                        const AssetImage(
                          "assets/icons/lighting.png",
                        ),
                        color: AppColors.primaryColor.withOpacity(0.05),
                        size: 270.h,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageIcon(
                            const AssetImage(
                              "assets/icons/delivery.png",
                            ),
                            size: 80.h,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            "Instant Delivery",
                            style: AppTypography.avenir().h5,
                          ),
                          Gap(8.h),
                          Text(
                            "Courier takes only your packages and delivers instantly",
                            style: AppTypography.avenir().bodyMediumR,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(16.h),
            GestureDetector(
              onTap: () => context.push("/schedule-delivery"),
              child: AspectRatio(
                aspectRatio: 1.9,
                child: Stack(
                  // alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          color: AppColors.primaryColor.withOpacity(0.1)),
                    ),
                    Positioned(
                      right: -50.w,
                      child: ImageIcon(
                        const AssetImage(
                          "assets/icons/stopwatch.png",
                        ),
                        color: AppColors.primaryColor.withOpacity(0.05),
                        size: 270.h,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageIcon(
                            const AssetImage(
                              "assets/icons/alarm-clock.png",
                            ),
                            size: 80.h,
                            color: AppColors.primaryColor,
                          ),
                          Text(
                            "Schedule Delivery",
                            style: AppTypography.avenir().h5,
                          ),
                          Gap(8.h),
                          Text(
                            "Courier comes to pick up on your specified date and time",
                            style: AppTypography.avenir().bodyMediumR,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "History",
                    style: AppTypography.avenir().bodyLargeSB,
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<HomeViewmodel>(context, listen: false)
                          .setIndex(1);
                    },
                    child: Text(
                      "View All",
                      style: AppTypography.avenir()
                          .bodyLargeSB
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Gap(8.h),
            deliveries.isEmpty
                ? Container()
                : Expanded(
                    child: ListView.builder(
                      itemCount: deliveries.length,
                      itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: TransactionWidget(
                            deliveryModel: deliveries[index],
                          )),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
