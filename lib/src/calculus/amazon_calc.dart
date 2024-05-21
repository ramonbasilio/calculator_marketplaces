class AmazonCalc {
  static double productValue(double tax, double margem, double cost) {
    double result = (tax + cost) / (0.867 - (margem / 100));
    return double.parse(result.toStringAsFixed(2));
  }

  static double gainValue(
    double productValue,
    double margem,
    double cost, [
    bool? ep,
  ]) {
    double result = 0.0;
    if (ep!) {
      result = (productValue - 0.13 * productValue - cost);
    } else {
      result = (productValue - 0.13 * productValue - 5.5 - cost);
    }
    return double.parse(result.toStringAsFixed(2));
  }

  static double incomeValue(double productValue, double tax) {
    double result = (0.87 * productValue) - tax;
    return double.parse(result.toStringAsFixed(2));
  }

  static double taxTotal(double productValue, double income) {
    double result = productValue - income;
    return double.parse(result.toStringAsFixed(2));
  }

  static double taxPercent(double productValue, double taxTotal) {
    double result = (taxTotal / productValue) * 100;
    return double.parse(result.toStringAsFixed(2));
  }
}
