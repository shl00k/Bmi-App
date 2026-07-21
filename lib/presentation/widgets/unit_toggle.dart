import 'package:bmi_app/theme/color_tokens.dart';
import 'package:flutter/material.dart';

class UnitToggle extends StatelessWidget {
  const UnitToggle({
    super.key,
    required this.unit01,
    required this.unit02,
    required this.isActive,
    required this.changeUnit,
    required this.isDarkMode,
  });

  final String unit01;
  final String unit02;
  final bool isActive;
  final ValueChanged<bool> changeUnit;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeUnit(!isActive);
      },
      child: Container(
        width: 140,
        height: 48,
        decoration: BoxDecoration(
          color: isDarkMode ? ColorTokens.secondary15 : ColorTokens.secondary85,
          borderRadius: .circular(16),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: isActive ? .centerStart : .centerEnd,
              duration: Duration(milliseconds: 300),
              child: Container(
                width: 70,
                height: 48,
                margin: .all(4),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? ColorTokens.secondary10
                      : ColorTokens.secondary95,
                  borderRadius: .circular(12),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      unit01,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: isActive
                            ? ColorTokens.primary50
                            : ColorTokens.secondary50,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      unit02,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: !isActive
                            ? ColorTokens.primary50
                            : ColorTokens.secondary50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
