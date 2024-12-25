import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/utiils/colors.dart';
import 'package:imove/utiils/textstyle.dart';

class CourierScreen extends StatefulWidget {
  const CourierScreen({super.key});

  @override
  State<CourierScreen> createState() => _CourierScreenState();
}

class _CourierScreenState extends State<CourierScreen> {
  int _currentTime = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentTime < 10) {
          setState(() {
            _currentTime++;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _currentTime >= 10
                              ? "Your courier has received your package"
                              : "Your courier is on it's way",
                          style: AppTypography.avenir().bodySmallM.copyWith(
                                color: AppColors.primaryColor,
                              ),
                        ),
                        _currentTime >= 10
                            ? Container()
                            : Text(
                                "2 mins away",
                                style:
                                    AppTypography.avenir().bodySmallM.copyWith(
                                          color: Colors.black45,
                                        ),
                              ),
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
                      child: _currentTime >= 10
                          ? ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: Colors.white,
                                      contentPadding: const EdgeInsets.all(20),
                                      title: const Row(
                                        children: [
                                          Icon(Icons.check_circle,
                                              color: Colors.green, size: 28),
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
                              child: const Text("Confirm "),
                            )
                          : TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text("Cancel"),
                            ),
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
