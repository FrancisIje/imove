import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/services/database/deliveries/firestore_deliverydb.dart';
import 'package:imove/utiils/colors.dart';
import 'package:imove/utiils/textstyle.dart';
import 'package:imove/view_models/basedelivery_viewmodel.dart';
import 'package:imove/view_models/instant_delivery_viewmodel.dart';
import 'package:imove/view_models/schedule_viewmodel.dart';
import 'package:provider/provider.dart';

class CourierScreen extends StatelessWidget {
  final String type;
  const CourierScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    late final BaseDeliveryViewModel viewModel;
    if (type == "instant") {
      viewModel = Provider.of<InstantDeliveryViewModel>(context);
    } else {
      viewModel = Provider.of<ScheduleDeliveryViewModel>(context);
    }
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
              aspectRatio: 1.5,
              child: Container(
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),
                child: StreamBuilder(
                  stream: FirestoreDeliverydb().getAcceptedRequest(
                    userId: userId,
                    rideId: viewModel.rideId,
                  ),
                  builder: (context, snapshot) {
                    Widget buildUI() {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          log("waiting");
                          return Center(
                            child: LoadingAnimationWidget.staggeredDotsWave(
                              color: AppColors.primaryColor,
                              size: 5,
                            ),
                          );

                        case ConnectionState.active:
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            log("Error occurred: ${snapshot.error}");
                            return const Center(
                              child: Text(
                                "An error occurred. Please try again.",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red),
                              ),
                            );
                          }

                          if (!snapshot.hasData || snapshot.data == null) {
                            log("No driver accepted request");
                            return Center(
                              child: Text(
                                "No data available.",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            );
                          }

                          // Build UI when data is available
                          final courierData =
                              snapshot.data; // Replace with your actual data
                          print(courierData!.data());

                          if (courierData.data() == null) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoadingAnimationWidget.staggeredDotsWave(
                                  color: AppColors.primaryColor,
                                  size: 50,
                                ),
                                Gap(24.h),
                                Text(
                                  "Waiting for a courier to accept",
                                  style: AppTypography.avenir()
                                      .bodyLargeM
                                      .copyWith(
                                        color: AppColors.primaryColor,
                                      ),
                                ),
                                Gap(16.h),
                                ElevatedButton(
                                    onPressed: () {
                                      context.go("/");
                                    },
                                    child: Text("Home"))
                              ],
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your courier has received your package",
                                    style: AppTypography.avenir()
                                        .bodySmallM
                                        .copyWith(
                                          color: AppColors.primaryColor,
                                        ),
                                  ),
                                  // _currentTime >= 10
                                  //     ? Container()
                                ],
                              ),
                              Gap(16.h),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: CachedNetworkImageProvider(
                                        "https://images.unsplash.com/photo-1522529599102-193c0d76b5b6?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmxhY2slMjBtYWxlfGVufDB8fDB8fHww"),
                                  ),
                                  Gap(8.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Gap(8),
                                      Text(
                                        "John Doe",
                                        style:
                                            AppTypography.avenir().bodySmallSB,
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
                                            // Handle rating change if needed
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.r),
                                      ),
                                      color: Colors.green.shade400,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                      horizontal: 12.w,
                                    ),
                                    child: const Icon(
                                      Icons.call_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Gap(16.h),
                              const Spacer(),
                              Align(
                                  alignment: Alignment.center,
                                  child:
                                      //  _currentTime >= 10
                                      ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            backgroundColor: Colors.white,
                                            contentPadding:
                                                const EdgeInsets.all(20),
                                            title: const Row(
                                              children: [
                                                Icon(Icons.check_circle,
                                                    color: Colors.green,
                                                    size: 28),
                                                SizedBox(width: 10),
                                                Text(
                                                  'Success!',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  height: 50,
                                                  width: 50,
                                                  child: Image.asset(
                                                    "assets/icons/order_success.png",
                                                    scale: 0.2,
                                                  ),
                                                ),
                                                const Text(
                                                  'Your operation was completed successfully.',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 20),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    context.go("/");
                                                  },
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: const Text("Confirm"),
                                  )
                                  // : TextButton(
                                  //     onPressed: () {
                                  //       context.pop();
                                  //     },
                                  //     child: const Text("Cancel"),
                                  //   ),
                                  ),
                            ],
                          );

                        default:
                          return const SizedBox();
                      }
                    }

                    return buildUI();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
