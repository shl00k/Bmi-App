class BmiCalculator {
  static double calculateBmi({
    required double heightInMeters,
    required double weightInKg,
  }) {
    return weightInKg / (heightInMeters * heightInMeters);
  }

  static String getStatus({required double bmi}) {
    if (bmi < 18.5) return 'Under Weight';
    if (bmi < 25) return 'Normal Weight';
    if (bmi < 30) return 'Over Weight';
    return 'Obese';
  }
}
