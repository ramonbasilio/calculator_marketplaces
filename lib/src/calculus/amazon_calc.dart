class AmazonCalc {
  static double productValue(double tax, double margem, double cost) {
    double result = (tax + cost) / (0.87 - (margem / 100));
    return double.parse(result.toStringAsFixed(2));
  }

  static double incomeValue(double productValue, double tax) {
    double result = (0.87 * productValue) - tax;
    return double.parse(result.toStringAsFixed(2));
  }

  static double gainValue(
    double productValue,
    double tax,
    double cost,
    String type,
  ) {
    double result = 0.0;
    if (type == 'EnvioProprio') {
      result = (0.87 * productValue - cost);
    }
    if (type == 'DBA<79') {
      result = (0.87 * productValue - 5.5 - cost);
    }

    if (type == 'DBA>79ouFBA') {
      result = (0.87 * productValue - tax - cost);
    }

    return double.parse(result.toStringAsFixed(2));
  }

  static double gainValueFBA(
      double productValue, double margem, double cost, double tax) {
    double result = 0.0;

    result = (productValue - 0.13 * productValue - tax - cost);

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
