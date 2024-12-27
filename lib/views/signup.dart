import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/view_models/sign_up_viewmodel.dart';

import 'package:imove/views/widgets/logo.dart';
import 'package:provider/provider.dart';

import '../utiils/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SignUpViewmodel>(context);
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
                                controller: viewModel.controllers[0],
                                decoration: InputDecoration(
                                  hintStyle: AppTypography.avenir()
                                      .bodySmallSB
                                      .copyWith(color: Colors.black45),
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
                                controller: viewModel.controllers[1],
                                decoration: InputDecoration(
                                  hintText: "Doe",
                                  hintStyle: AppTypography.avenir()
                                      .bodySmallSB
                                      .copyWith(color: Colors.black45),
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
                    controller: viewModel.controllers[2],
                    decoration: InputDecoration(
                      hintText: "+2348011111111",
                      hintStyle: AppTypography.avenir()
                          .bodySmallSB
                          .copyWith(color: Colors.black45),
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
                    controller: viewModel.controllers[3],
                    decoration: InputDecoration(
                      hintText: "johndoe@email.com",
                      hintStyle: AppTypography.avenir()
                          .bodySmallSB
                          .copyWith(color: Colors.black45),
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
                    obscureText: true,
                    controller: viewModel.controllers[4],
                    decoration: InputDecoration(
                      hintText: "********",
                      hintStyle: AppTypography.avenir()
                          .bodySmallSB
                          .copyWith(color: Colors.black45),
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
                    onPressed: () async {
                      bool success = await viewModel.handleSignUp();
                      if (success) {
                        context.push("/register/verify");
                      }
                    },
                    child: viewModel.isLoading
                        ? SizedBox(
                            height: 10,
                            width: 10,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ))
                        : const Text("Continue"),
                  ),
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
                          context.push("/login");
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
