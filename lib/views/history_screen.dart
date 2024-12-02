import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:imove/utiils/utils.dart';
import 'package:imove/view_models/history_viewmodel.dart';
import 'package:imove/views/widgets/transaction_widget.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deliveries = Provider.of<HistoryViewmodel>(context).deliveries;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Delivery History",
                  style: AppTypography.avenir().h6,
                ),
              ),
              Gap(16.h),
              Expanded(
                child: ListView.builder(
                  itemCount: deliveries.length,
                  itemBuilder: (context, index) =>
                      TransactionWidget(deliveryModel: deliveries[index]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
