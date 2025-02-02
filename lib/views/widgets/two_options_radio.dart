import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imove/utiils/utils.dart';
import 'package:imove/view_models/instant_delivery_viewmodel.dart';
import 'package:imove/view_models/schedule_viewmodel.dart';
import 'package:provider/provider.dart';

class TwoOptionsRadio extends StatefulWidget {
  final String option1;
  final String option2;
  final bool isInstant;

  const TwoOptionsRadio({
    super.key,
    required this.option1,
    required this.option2,
    required this.isInstant,
  });

  @override
  TwoOptionsRadioState createState() => TwoOptionsRadioState();
}

class TwoOptionsRadioState extends State<TwoOptionsRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 150,
          child: RadioListTile<String>(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              widget.option1,
              style: AppTypography.avenir().bodyMediumR,
            ),
            value: widget.option1,
            groupValue: widget.isInstant
                ? context.watch<InstantDeliveryViewModel>().payer
                : context.watch<ScheduleDeliveryViewModel>().payer,
            onChanged: (_) => widget.isInstant
                ? context.read<InstantDeliveryViewModel>().setPayer = "Me"
                : context.read<ScheduleDeliveryViewModel>().setPayer = "Me",
          ),
        ),
        const Expanded(child: Gap(2)),
        SizedBox(
          height: 50,
          width: 150,
          child: RadioListTile<String>(
            contentPadding: const EdgeInsets.all(0),
            toggleable: true,
            activeColor: AppColors.primaryColor,
            title: Text(
              widget.option2,
              style: AppTypography.avenir().bodyMediumR,
            ),
            value: widget.option2,
            groupValue: widget.isInstant
                ? context.watch<InstantDeliveryViewModel>().payer
                : context.watch<ScheduleDeliveryViewModel>().payer,
            onChanged: (_) => widget.isInstant
                ? context.read<InstantDeliveryViewModel>().setPayer =
                    "Recipient"
                : context.read<ScheduleDeliveryViewModel>().setPayer =
                    "Recipient",
          ),
        ),
        const Expanded(child: Gap(2)),
      ],
    );
  }
}
