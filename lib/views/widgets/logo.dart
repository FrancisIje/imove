import 'package:flutter/material.dart';
import 'package:imove/utiils/textstyle.dart';
import 'package:imove/utiils/utils.dart';

class ImoveLogo extends StatelessWidget {
  final Color color;
  const ImoveLogo({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: Align(
          alignment: Alignment.center,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "i",
              style: AppTypography.baloo()
                  .h4
                  .copyWith(color: AppColors.primaryColor),
            ),
            TextSpan(
              text: "Move",
              style: AppTypography.baloo().h4.copyWith(color: color),
            ),
          ]))),
    );
  }
}
