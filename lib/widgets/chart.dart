import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  const SimpleBarChart(this.seriesList, this.animate, {Key? key})
      : super(key: key);

  SimpleBarChart.withoutData(this.animate, {Key? key})
      : seriesList = _createSampleData(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<KgMonth, String>> _createSampleData() {
    final data = getData();
    return buildChart(data, "Feb");
  }

  static getData() {
    return [
      KgMonth('Jul', 75),
      KgMonth('Aug', 80),
      KgMonth('Sep', 83),
      KgMonth('Oct', 85),
      KgMonth('Nov', 81),
      KgMonth('Dec', 76),
      KgMonth('Jan', 80),
      KgMonth('Feb', 82),
    ];
  }

  static buildChart(data, month) {
    return [
      charts.Series<KgMonth, String>(
          id: 'Weight',
          colorFn: (KgMonth m, __) {
            if (m.month == month) {
              return charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent);
            } else {
              return charts.ColorUtil.fromDartColor(Colors.grey);
            }
          },
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
