import 'package:bmi_app/data/constants.dart';
import 'package:bmi_app/presentation/widgets/slider_ticks.dart';
import 'package:bmi_app/presentation/widgets/unit_toggle.dart';
import 'package:bmi_app/theme/color_tokens.dart';
import 'package:flutter/material.dart';

class WeightBlock extends StatelessWidget {
  const WeightBlock({
    super.key,
    required this.isDarkMode,
    required this.selectedWeight,
    required this.isWeightInKg,
    required this.onWeightChanged,
    required this.onUnitChange,
  });

  final bool isDarkMode;
  final int selectedWeight;
  final bool isWeightInKg;
  final ValueChanged<int> onWeightChanged;
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
                    'Weight',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: ColorTokens.secondary50,
                    ),
                  ),
                  Text(
                    isWeightInKg ? '$selectedWeight Kg' : '$selectedWeight Lbs',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            UnitToggle(
              unit01: 'Kg',
              unit02: 'Lbs',
              isActive: isWeightInKg,
              changeUnit: onUnitChange,
              isDarkMode: isDarkMode,
            ),
          ],
        ),
        SliderTicks(
          key: ValueKey(isWeightInKg),
          isCustomDivision: false,
          minimumValue: isWeightInKg ? minimumWeightInKg : minimumWeightInLbs,
          maximumValue: isWeightInKg ? maximumWeightInKg : maximumWeightInLbs,
          selectedValue: selectedWeight,
          majorTicksDivision: 10,
          midTicksDivision: 5,
          onChanged: onWeightChanged,
        ),
      ],
    );
  }
}
