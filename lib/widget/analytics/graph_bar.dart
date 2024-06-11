import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_company_profile_methods.dart';
import 'dart:math'; // Import for random number generation
import '../../Models/todaySales.dart';
import '../../Repository/firebase/model methods/dailySalesFetcher.dart';
import 'bar_extenshio.dart';

class Bar extends StatelessWidget {
  Bar({Key? key}) : super(key: key);

  Future<salesToday> fetchSales() {
    return FirebaseTodaySales()
        .read(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  }

  // Method to generate random colors
  charts.Color _generateRandomColor() {
    final Random random = Random();
    // Define a list of base hues for the desired colors
    final List<int> baseHues = [0, 30, 60, 180, 210];
    // Randomly select one of the base hues
    int baseHue = baseHues[random.nextInt(baseHues.length)];
    // Adjust the saturation and value (brightness) for more vibrant colors
    double saturation = 0.5 + random.nextDouble() * 0.5; // Range: 0.5 to 1.0
    double value = 0.5 + random.nextDouble() * 0.5; // Range: 0.5 to 1.0
    // Convert HSV (Hue, Saturation, Value) to RGB (Red, Green, Blue)
    List<double> rgb = _hsvToRgb(baseHue.toDouble(), saturation, value);
    return charts.Color(
      r: (rgb[0] * 255).round(),
      g: (rgb[1] * 255).round(),
      b: (rgb[2] * 255).round(),
      a: 255,
    );
  }

  // Function to convert HSV to RGB
  List<double> _hsvToRgb(double hue, double saturation, double value) {
    double chroma = value * saturation;
    double hueDash = hue / 60.0;
    double x = chroma * (1 - (hueDash % 2 - 1).abs());
    double r, g, b;
    if (hueDash < 1) {
      r = chroma;
      g = x;
      b = 0;
    } else if (hueDash < 2) {
      r = x;
      g = chroma;
      b = 0;
    } else if (hueDash < 3) {
      r = 0;
      g = chroma;
      b = x;
    } else if (hueDash < 4) {
      r = 0;
      g = x;
      b = chroma;
    } else if (hueDash < 5) {
      r = x;
      g = 0;
      b = chroma;
    } else {
      r = chroma;
      g = 0;
      b = x;
    }
    double m = value - chroma;
    return [r + m, g + m, b + m];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<salesToday>(
      future: fetchSales(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching sales data'));
        } else if (!snapshot.hasData || snapshot.data!.Sales.isEmpty) {
          return Center(child: Text('No sales data available'));
        }

        final salesData = snapshot.data!.Sales;
        final List<BarChartModel> data = salesData.map((sale) {
          var parts = sale.split(', ');
          String companyName =
              parts[1]; // Assuming the company name is in the first part
          double primary = double.parse(parts[1]);
          double secondary = double.parse(parts[2]);

          return BarChartModel(
            year: companyName, // Use companyName as the domain value
            financial: primary, // Or use secondary, or a combination of both
            color: _generateRandomColor(), // Use random color
          );
        }).toList();

        List<charts.Series<BarChartModel, String>> series = [
          charts.Series(
            id: "financial",
            data: data,
            domainFn: (BarChartModel series, _) => series.year,
            measureFn: (BarChartModel series, _) => series.financial,
            colorFn: (BarChartModel series, _) => series.color,
          ),
        ];

        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: charts.BarChart(
                series,
                animate: true,
                behaviors: [
                  charts.ChartTitle(
                    'Daily Sales Data',
                    behaviorPosition: charts.BehaviorPosition.top,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea,
                  ),
                ],
                defaultRenderer: charts.BarRendererConfig(
                  maxBarWidthPx: (constraints.maxWidth / data.length).round(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
