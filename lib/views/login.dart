import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:imove/utiils/colors.dart';
import 'package:imove/utiils/textstyle.dart';
import 'package:imove/views/signup.dart';
import 'package:imove/views/widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImoveLogo(color: Colors.black),
                Gap(16.h),
                Text(
                  "Welcome",
                  style: AppTypography.avenir().bodyLargeSB,
                ),
                Gap(8.h),
                Text(
                  "Please input your details",
                  style: AppTypography.avenir().bodySmallSB.copyWith(
                      color: const Color.fromARGB(255, 118, 117, 117)),
                ),
                Gap(32.h),
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
                Gap(16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: AppTypography.avenir().bodyMediumM,
                  ),
                ),
                Gap(32.h),
                ElevatedButton(onPressed: () {}, child: const Text("Login")),
                Gap(32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Need an account?",
                        style: AppTypography.avenir().bodyMediumM),
                    Gap(8.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                      },
                      child: Text(
                        "Sign up",
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
    );
  }
}
