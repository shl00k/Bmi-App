import 'package:bmi_app/data/constants.dart';
import 'package:bmi_app/domain/bmi_calculator.dart';
import 'package:bmi_app/domain/unit_converter.dart';
import 'package:bmi_app/presentation/components/height_block.dart';
import 'package:bmi_app/presentation/components/weight_block.dart';
import 'package:bmi_app/presentation/widgets/action_button.dart';
import 'package:bmi_app/theme/color_tokens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChange,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onThemeChange;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedHeight = initialHeightInInches;
  int selectedWeight = initialWeightInKgs;

  bool isHeightInFeet = true;
  bool isWeightInkg = true;

  double bmi = BmiCalculator.calculateBmi(
    heightInMeters: UnitConverter.inchesToMeters(
      heightInInches: initialHeightInInches,
    ),
    weightInKg: initialWeightInKgs.toDouble(),
  );

  void calculateBmi() {
    double height = isHeightInFeet
        ? UnitConverter.inchesToMeters(heightInInches: selectedHeight)
        : UnitConverter.centiMeterToMeter(heightInCentiMeter: selectedHeight);
    double weight = isWeightInkg
        ? selectedWeight.toDouble()
        : UnitConverter.poundsToKilograms(weightInPounds: selectedWeight);
    setState(() {
      bmi = BmiCalculator.calculateBmi(
        heightInMeters: height,
        weightInKg: weight,
      );
    });
  }

  void onHeightUnitChange(bool value) {
    setState(() {
      isHeightInFeet = value;
      if (!isHeightInFeet) {
        selectedHeight = UnitConverter.inchesToCentiMeters(
          heightInInches: selectedHeight,
        ).round();
      }
      if (isHeightInFeet) {
        selectedHeight = UnitConverter.centiMeterstoInches(
          heihgtInCentiMeters: selectedHeight,
        ).round();
      }
    });
  }

  void onWeightUnitChange(bool value) {
    setState(() {
      isWeightInkg = value;
      if (!isWeightInkg) {
        selectedWeight = UnitConverter.kiloGramsToPounds(
          weightInKilograms: selectedWeight,
        ).round();
      }
      if (isWeightInkg) {
        selectedWeight = UnitConverter.poundsToKilograms(
          weightInPounds: selectedWeight,
        ).round();
      }
    });
  }

  void onHeightChange(int value) {
    setState(() {
      selectedHeight = value;
    });
  }

  void onWeightChange(int value) {
    setState(() {
      selectedWeight = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        toolbarHeight: 64,
        shape: RoundedRectangleBorder(
          borderRadius: .vertical(bottom: .circular(24)),
        ),
        actions: [
          IconButton(
            color: ColorTokens.secondary50,
            onPressed: () {
              setState(() {
                widget.onThemeChange(!widget.isDarkMode);
              });
            },
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              size: 24,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    bmi.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    BmiCalculator.getStatus(bmi: bmi),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.isDarkMode
                  ? ColorTokens.secondary10
                  : ColorTokens.secondary90,
              borderRadius: .vertical(top: .circular(32)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 32,
              ),
              child: Column(
                spacing: 24,
                children: [
                  Text(
                    'Enter your Details to calculate your Body Mass Index',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: ColorTokens.secondary50,
                    ),
                  ),
                  HeightBlock(
                    isDarkMode: widget.isDarkMode,
                    selectedHeight: selectedHeight,
                    isHeightInFeet: isHeightInFeet,
                    onHeightChanged: onHeightChange,
                    onUnitChange: onHeightUnitChange,
                  ),
                  WeightBlock(
                    isDarkMode: widget.isDarkMode,
                    selectedWeight: selectedWeight,
                    isWeightInKg: isWeightInkg,
                    onWeightChanged: onWeightChange,
                    onUnitChange: onWeightUnitChange,
                  ),
                  ActionButton(action: calculateBmi),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
