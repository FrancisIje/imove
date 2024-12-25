import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/utiils/utils.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:imove/views/widgets/error_toast.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FocusNode> focusNodes = [];
    List<TextEditingController> controllers = [];
    for (var i = 0; i < 4; i++) {
      focusNodes.add(FocusNode());
      controllers.add(TextEditingController());
    }
    return Scaffold(
        // backgroundColor: Colors.black,
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),
            child: Row(
              children: [
                const Gap(
                  8,
                ),
                // GestureDetector(
                //     onTap: () => Navigator.of(context).pop(),
                //     child: const Icon(
                //       Icons.arrow_back_outlined,
                //       color: Colors.white,
                //     )),
                const Expanded(child: Gap(4)),
                Text(
                  "Verification",
                  style: AppTypography.avenir().h4,
                ),
                const Expanded(child: Gap(4)),
              ],
            ),
          ),
          Gap(
            32.h,
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(16.h),
                      Text(
                        "Verify Your New Account",
                        style: AppTypography.avenir().h6,
                        textAlign: TextAlign.center,
                      ),
                      Gap(16.h),
                      Text(
                        "Please enter 4- digit code from your email",
                        textAlign: TextAlign.center,
                        style: AppTypography.avenir()
                            .bodyLargeM
                            .copyWith(color: Colors.black26),
                      ),
                      Gap(32.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: (56),
                            width: (56),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            decoration: BoxDecoration(
                                color: AppColors.textFieldBackgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r)),
                                border: Border.all(style: BorderStyle.none)),
                            child: TextField(
                              focusNode: focusNodes[0],
                              controller: controllers[0],
                              textAlign: TextAlign.center,
                              style: AppTypography.avenir().bodyLargeSB,
                              maxLength: 1,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  focusNodes[1].requestFocus();
                                }
                              },
                              onEditingComplete: () {
                                focusNodes[1].requestFocus();
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none, counterText: ""),
                            ),
                          ),
                          Gap(16.h),
                          Container(
                            height: (56),
                            width: (56),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            decoration: BoxDecoration(
                                color: AppColors.textFieldBackgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r)),
                                border: Border.all(style: BorderStyle.none)),
                            child: TextField(
                              focusNode: focusNodes[1],
                              controller: controllers[1],
                              textAlign: TextAlign.center,
                              style: AppTypography.avenir().bodyLargeSB,
                              maxLength: 1,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  focusNodes[2].requestFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none, counterText: ""),
                            ),
                          ),
                          Gap(16.h),
                          Container(
                            height: (56),
                            width: (56),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            decoration: BoxDecoration(
                                color: AppColors.textFieldBackgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r)),
                                border: Border.all(style: BorderStyle.none)),
                            child: TextField(
                              focusNode: focusNodes[2],
                              controller: controllers[2],
                              textAlign: TextAlign.center,
                              style: AppTypography.avenir().bodyLargeSB,
                              maxLength: 1,
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  focusNodes[3].requestFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none, counterText: ""),
                            ),
                          ),
                          Gap(16.h),
                          Container(
                            height: (56),
                            width: (56),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            decoration: BoxDecoration(
                                color: AppColors.textFieldBackgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r)),
                                border: Border.all(style: BorderStyle.none)),
                            child: TextField(
                              focusNode: focusNodes[3],
                              controller: controllers[3],
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: AppTypography.avenir().bodyLargeSB,
                              onChanged: (value) {
                                focusNodes[3].unfocus();
                              },
                              decoration: const InputDecoration(
                                  border: InputBorder.none, counterText: ""),
                            ),
                          ),
                        ],
                      ),
                      Gap(24.h),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Didn't receive the code?  ",
                            style: AppTypography.avenir()
                                .bodySmallM
                                .copyWith(color: Colors.black26)),
                        TextSpan(
                            text: "Resend in  ",
                            style: AppTypography.avenir().bodySmallM),
                        TextSpan(
                            text: "00:45",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                errorToast("Cannot resend now");
                              },
                            style: AppTypography.avenir()
                                .bodySmallM
                                .copyWith(color: AppColors.primaryColor)),
                      ])),
                      Gap(24.h),
                      ElevatedButton(
                          child: const Text("Verify"),
                          onPressed: () {
                            if (controllers[0].text.isEmpty ||
                                controllers[1].text.isEmpty ||
                                controllers[2].text.isEmpty ||
                                controllers[3].text.isEmpty) {
                              errorToast("Enter verification code");
                            } else {
                              context.push("/");
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
