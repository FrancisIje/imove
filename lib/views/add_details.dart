import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:imove/helpers/add_details_type_enum.dart';
import 'package:imove/utiils/colors.dart';
import 'package:imove/utiils/textstyle.dart';
import 'package:imove/view_models/instant_delivery_viewmodel.dart';
import 'package:imove/view_models/schedule_viewmodel.dart';

import 'package:imove/views/widgets/two_options_radio.dart';
import 'package:provider/provider.dart';

class AddDetailsScreen extends StatelessWidget {
  final String type;
  const AddDetailsScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    late final viewModel;
    if (type == "instant") {
      viewModel = Provider.of<InstantDeliveryViewModel>(context);
    } else {
      viewModel = Provider.of<ScheduleDeliveryViewModel>(context);
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(8.h),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: const Icon(Icons.arrow_back_ios_new),
                    ),
                    Gap(16.w),
                    Text(
                      "Details",
                      style: AppTypography.avenir().bodyLargeSB,
                    ),
                  ],
                ),
                Gap(24.h),
                Text(
                  "What are you sending?",
                  style: AppTypography.avenir()
                      .bodySmallM
                      .copyWith(color: Colors.black45),
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Select Category",
                    enabled: true,
                    fillColor: AppColors.textFieldBackgroundColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "Electronics",
                      child: Text("Electronics"),
                    ),
                    DropdownMenuItem(
                      value: "Documents",
                      child: Text("Documents"),
                    ),
                    DropdownMenuItem(
                      value: "Apparels",
                      child: Text("Apparels"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value!.isNotEmpty) {
                      viewModel.setCategory = value;
                    }
                  },
                ),
                Gap(8.h),
                Row(
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: AppColors.primaryColor,
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Text(
                        "Transporting prohibited items (e.g., illegal, hazardous, or restricted goods) and violating safety protocols are strictly forbidden.",
                        style: AppTypography.avenir().captionR.copyWith(
                              color: Colors.black38,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                Gap(16.h),
                Text(
                  "Quantity",
                  style: AppTypography.avenir()
                      .bodySmallM
                      .copyWith(color: Colors.black45),
                ),
                TextField(
                  controller: viewModel.controllers[4],
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "1 - 20",
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
                Gap(16.h),
                Text(
                  "Select who pays",
                  style: AppTypography.avenir()
                      .bodySmallM
                      .copyWith(color: Colors.black45),
                ),
                TwoOptionsRadio(
                  option1: "Me",
                  option2: "Recipient",
                  isInstant: type == "instant",
                ),
                Gap(16.h),
                Text(
                  "Receipient Name",
                  style: AppTypography.avenir()
                      .bodySmallM
                      .copyWith(color: Colors.black45),
                ),
                TextField(
                  controller: viewModel.controllers[2],
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  decoration: InputDecoration(
                    hintText: "Enter recipient's name",
                    hintStyle: AppTypography.avenir()
                        .bodySmallSB
                        .copyWith(color: Colors.black45),
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
                Text(
                  "Recipient Number",
                  style: AppTypography.avenir()
                      .bodySmallM
                      .copyWith(color: Colors.black45),
                ),
                TextField(
                  controller: viewModel.controllers[3],
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    hintText: "Enter recipient's number",
                    fillColor: AppColors.textFieldBackgroundColor,
                    hintStyle: AppTypography.avenir()
                        .bodySmallSB
                        .copyWith(color: Colors.black45),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        borderSide: BorderSide.none),
                  ),
                ),
                const AspectRatio(aspectRatio: 2.5),
                ElevatedButton(
                  onPressed: () {
                    final isFilled = viewModel.checkFields();
                    if (isFilled) {
                      context.push("/confirm-details/$type");
                    }
                    // context.push()
                  },
                  child: const Text("Continue"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
