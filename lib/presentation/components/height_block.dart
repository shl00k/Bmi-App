import 'package:bmi_app/data/constants.dart';
import 'package:bmi_app/presentation/widgets/slider_ticks.dart';
import 'package:bmi_app/presentation/widgets/unit_toggle.dart';
import 'package:bmi_app/theme/color_tokens.dart';
import 'package:flutter/material.dart';

class HeightBlock extends StatelessWidget {
  const HeightBlock({
    super.key,
    required this.isDarkMode,
    required this.isHeightInFeet,
    required this.selectedHeight,
    required this.onHeightChanged,
    required this.onUnitChange,
  });

  final bool isDarkMode;
  final bool isHeightInFeet;
  final int selectedHeight;
  final ValueChanged<int> onHeightChanged;
  final ValueChanged<bool> onUnitChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Height',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: ColorTokens.secondary50,
                    ),
                  ),
                  Text(
                    isHeightInFeet
                        ? '${selectedHeight ~/ 12} Ft ${selectedHeight % 12}'
                        : '$selectedHeight Cm',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            UnitToggle(
              unit01: 'Ft',
              unit02: 'Cm',
              isActive: isHeightInFeet,
              changeUnit: onUnitChange,
              isDarkMode: isDarkMode,
            ),
          ],
        ),
        SliderTicks(
          key: ValueKey(isHeightInFeet),
          isCustomDivision: isHeightInFeet ? true : false,
          minimumValue: isHeightInFeet
              ? minimumHeightInInches
              : minimumHeightInCm,
          maximumValue: isHeightInFeet
              ? maximumHeightInInches
              : maximumHeightInCm,
          selectedValue: selectedHeight,
          majorTicksDivision: isHeightInFeet ? 12 : 10,
          midTicksDivision: isHeightInFeet ? 6 : 5,
          onChanged: onHeightChanged,
        ),
      ],
    );
  }
}
