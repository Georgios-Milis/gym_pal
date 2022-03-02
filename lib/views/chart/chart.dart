import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<KgMonth, String>> _createSampleData() {
    final data = [
      new KgMonth('Sep', 80),
      new KgMonth('Oct', 85),
      new KgMonth('Nov', 81),
      new KgMonth('Dec', 76),
    ];

    return [
      new charts.Series<KgMonth, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (KgMonth kg, _) => kg.month,
        measureFn: (KgMonth kg, _) => kg.kg,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class KgMonth {
  final String month;
  final int kg;

  KgMonth(this.month, this.kg);
}