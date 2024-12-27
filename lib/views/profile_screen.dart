import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/services/auth/auth_service.dart';
import 'package:imove/utiils/utils.dart';
import 'package:imove/view_models/user_viewmodel.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Gap(16.h),
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.primaryColor.withOpacity(0.3),
                child:
                    Consumer<UserViewmodel>(builder: (context, value, child) {
                  return Text(
                    "${value.user.firstName[0].capitalize}${value.user.lastName[0].capitalize}",
                    style: AppTypography.avenir().h6,
                  );
                }),
              ),
              Gap(8.h),
              Consumer<UserViewmodel>(builder: (context, value, child) {
                return Text(
                  "${value.user.firstName.capitalize} ${value.user.lastName.capitalize}",
                  style: AppTypography.avenir().bodyLargeSB,
                );
              }),
              Gap(24.h),
              Divider(),
              Gap(8.h),
              ListTile(
                leading: Icon(
                  Icons.payment_outlined,
                  color: Color(0xFFB0B0B0),
                ),
                title: Text(
                  "Payments",
                  style: AppTypography.avenir()
                      .bodyMediumSB
                      .copyWith(color: Color(0xFF1D3557).withOpacity(0.73)),
                ),
              ),
              Gap(8.h),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Color(0xFFB0B0B0),
                ),
                title: Text(
                  "Settings",
                  style: AppTypography.avenir()
                      .bodyMediumSB
                      .copyWith(color: Color(0xFF1D3557).withOpacity(0.73)),
                ),
              ),
              Gap(8.h),
              ListTile(
                leading: Icon(
                  Icons.help,
                  color: Color(0xFFB0B0B0),
                ),
                title: Text(
                  "Support/FAQ",
                  style: AppTypography.avenir()
                      .bodyMediumSB
                      .copyWith(color: Color(0xFF1D3557).withOpacity(0.73)),
                ),
              ),
              Gap(8.h),
              ListTile(
                leading: Icon(
                  Icons.feedback,
                  color: Color(0xFFB0B0B0),
                ),
                title: Text(
                  "Feedback",
                  style: AppTypography.avenir()
                      .bodyMediumSB
                      .copyWith(color: Color(0xFF1D3557).withOpacity(0.73)),
                ),
              ),
              Gap(8.h),
              ListTile(
                leading: Icon(
                  Icons.people,
                  color: Color(0xFFB0B0B0),
                ),
                title: Text(
                  "Invite Friends",
                  style: AppTypography.avenir()
                      .bodyMediumSB
                      .copyWith(color: Color(0xFF1D3557).withOpacity(0.73)),
                ),
              ),
              Gap(8.h),
              ListTile(
                onTap: () async {
                  AuthService.emailPassword().signout().then(
                        (value) => context.go("/onboarding"),
                      );
                },
                leading: Icon(
                  Icons.logout,
                  color: AppColors.primaryColor,
                ),
                title: Text(
                  "Sign out",
                  style: AppTypography.avenir()
                      .bodyMediumSB
                      .copyWith(color: Color(0xFF1D3557).withOpacity(0.73)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
