import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/utiils/utils.dart';
import 'package:imove/views/login.dart';
import 'package:imove/views/widgets/logo.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Image.asset(
              "assets/images/man_on_phone.jpg",
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.black.withOpacity(0.8),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImoveLogo(
                    color: Colors.white,
                  ),
                  const AspectRatio(aspectRatio: 0.9),
                  Text(
                    "Request for Delivery\nin few clicks",
                    style:
                        AppTypography.baloo().h5.copyWith(color: Colors.white),
                  ),
                  const Gap(24),
                  Text(
                    "On-demand delivery whenever and wherever the need arises",
                    style: AppTypography.avenir()
                        .bodyLargeM
                        .copyWith(color: Colors.white),
                  ),
                  Gap(16.h),
                  ElevatedButton(
                    onPressed: () {
                      context.go("/register");
                    },
                    child: const Text("Get Started"),
                  ),
                  Gap(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account already? ",
                        style: AppTypography.avenir()
                            .bodySmallSB
                            .copyWith(color: Colors.white),
                      ),
                      Gap(4.w),
                      GestureDetector(
                        onTap: () {
                          context.go("/login");
                        },
                        child: Text(
                          "Sign In ",
                          style: AppTypography.avenir()
                              .bodySmallSB
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
