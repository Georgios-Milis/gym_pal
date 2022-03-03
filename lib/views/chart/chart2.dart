import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  List<charts.Series<dynamic, String>> seriesList;
  bool animate;

  SimpleBarChart(this.seriesList, this.animate, {Key? key}) : super(key: key);

  SimpleBarChart.withoutData(this.animate, {Key? key})
      : seriesList = _createSampleData(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<KgMonth, String>> _createSampleData() {
    final data = [
      KgMonth('Sep', 80),
      KgMonth('Oct', 85),
      KgMonth('Nov', 81),
      KgMonth('Dec', 76),
    ];

    return [
      charts.Series<KgMonth, String>(
          id: 'Sales',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (KgMonth kg, _) => kg.month,
          measureFn: (KgMonth kg, _) => kg.kg,
          data: data)
    ];
  }
}

/// Sample ordinal data type.
class KgMonth {
  final String month;
  final int kg;

  KgMonth(this.month, this.kg);
}
