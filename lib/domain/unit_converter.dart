class UnitConverter {
  // Height
  static double inchesToMeters({required int heightInInches}) {
    return 0.0254 * heightInInches;
  }

  static double inchesToCentiMeters({required int heightInInches}) {
    return 2.54 * heightInInches;
  }

  static double centiMeterToMeter({required int heightInCentiMeter}) {
    return 0.01 * heightInCentiMeter;
  }

  static double centiMeterstoInches({required int heihgtInCentiMeters}) {
    return 0.393701 * heihgtInCentiMeters;
  }

  // Weight
  static double poundsToKilograms({required int weightInPounds}) {
    return 0.453592 * weightInPounds;
  }

  static double kiloGramsToPounds({required int weightInKilograms}) {
    return weightInKilograms / 0.453592;
  }
}
