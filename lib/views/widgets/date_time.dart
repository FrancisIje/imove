import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:imove/utiils/utils.dart';
import 'package:imove/view_models/schedule_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker({super.key});

  @override
  CustomDateTimePickerState createState() => CustomDateTimePickerState();
}

class CustomDateTimePickerState extends State<CustomDateTimePicker> {
  Future<void> _pickDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme:
                const ColorScheme.light(primary: AppColors.primaryColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    // if (date != null) {
    //   TimeOfDay? time = await showTimePicker(
    //     context: context,
    //     initialTime: TimeOfDay.now(),
    //     builder: (context, child) {
    //       return Theme(
    //         data: ThemeData.light().copyWith(
    //           primaryColor: Colors.purple,
    //           colorScheme: const ColorScheme.light(primary: Colors.purple),
    //         ),
    //         child: child!,
    //       );
    //     },
    //   );

    // if (time != null) {
    //   setState(() {

    //   });
    // }
    if (date != null) {
      context.read<ScheduleDeliveryViewModel>().setDeliveryDate = DateTime(
        date.year,
        date.month,
        date.day,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDate =
        Provider.of<ScheduleDeliveryViewModel>(context).deliveryDate;
    print(selectedDate);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Delivery Date', style: AppTypography.avenir().bodySmallM),
        Gap(8.h),
        GestureDetector(
          onTap: _pickDateTime,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.textFieldBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            child: Text(
                selectedDate == null
                    ? 'Select Date & Time'
                    : 'Selected: ${DateFormat.yMMMMEEEEd().format(selectedDate)}',
                style: AppTypography.avenir()
                    .bodySmallSB
                    .copyWith(color: Colors.black45)),
          ),
        ),
      ],
    );
  }
}
