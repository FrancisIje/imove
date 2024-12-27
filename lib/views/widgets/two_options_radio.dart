import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:imove/utiils/utils.dart';
import 'package:imove/view_models/instant_delivery_viewmodel.dart';
import 'package:provider/provider.dart';

class TwoOptionsRadio extends StatefulWidget {
  final String option1;
  final String option2;

  const TwoOptionsRadio({
    super.key,
    required this.option1,
    required this.option2,
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
            groupValue: context.watch<InstantDeliveryViewmodel>().payer,
            onChanged: (_) =>
                context.read<InstantDeliveryViewmodel>().setPayer = "Me",
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
            groupValue: context.watch<InstantDeliveryViewmodel>().payer,
            onChanged: (_) =>
                context.read<InstantDeliveryViewmodel>().setPayer = "Recipient",
          ),
        ),
        const Expanded(child: Gap(2)),
      ],
    );
  }
}
