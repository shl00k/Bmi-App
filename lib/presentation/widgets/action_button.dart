import 'package:bmi_app/theme/color_tokens.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.action});

  final Function action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: .circular(16)),
          backgroundColor: ColorTokens.primary50,
        ),
        onPressed: () {
          action();
        },
        child: Text(
          'Calculate BMI',
          style: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(color: ColorTokens.secondary95),
        ),
      ),
    );
  }
}
