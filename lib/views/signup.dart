import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:imove/views/login.dart';
import 'package:imove/views/verification.dart';

import 'package:imove/views/widgets/logo.dart';

import '../utiils/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImoveLogo(color: Colors.black),
                  Gap(16.h),
                  Text(
                    "Let's get started",
                    style: AppTypography.avenir().bodyLargeSB,
                  ),
                  Gap(8.h),
                  Text(
                    "Please input your details",
                    style: AppTypography.avenir().bodySmallSB.copyWith(
                        color: const Color.fromARGB(255, 118, 117, 117)),
                  ),
                  Gap(32.h),
                  AspectRatio(
                    aspectRatio: 4,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First Name",
                                style: AppTypography.avenir().bodyMediumSB,
                              ),
                              Gap(4.h),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "John",
                                  enabled: true,
                                  fillColor: AppColors.textFieldBackgroundColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.r),
                                      ),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(16.r),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Name",
                                style: AppTypography.avenir().bodyMediumSB,
                              ),
                              Gap(4.h),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Doe",
                                  enabled: true,
                                  fillColor: AppColors.textFieldBackgroundColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.r),
                                      ),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(24.h),
                  Text(
                    "Phone number",
                    style: AppTypography.avenir().bodyMediumSB,
                  ),
                  Gap(4.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "+2348011111111",
                      enabled: true,
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  Gap(24.h),
                  Text(
                    "Email",
                    style: AppTypography.avenir().bodyMediumSB,
                  ),
                  Gap(4.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "johndoe@email.com",
                      enabled: true,
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  Gap(24.h),
                  Text(
                    "Password",
                    style: AppTypography.avenir().bodyMediumSB,
                  ),
                  Gap(4.h),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "********",
                      enabled: true,
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.r),
                          ),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  Gap(32.h),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const VerificationScreen(),
                        ));
                      },
                      child: const Text("Continue")),
                  Gap(16.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      "By signing up, you agree to the TOS and Privacy Policy",
                      style: AppTypography.avenir().captionM,
                    ),
                  ),
                  Gap(32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: AppTypography.avenir().bodyMediumM),
                      Gap(8.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                        },
                        child: Text(
                          "Log in",
                          style: AppTypography.avenir()
                              .bodyMediumM
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
