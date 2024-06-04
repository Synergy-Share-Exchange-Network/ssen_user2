import 'package:animate_do/animate_do.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/helper_function.dart';

class LineChartgraphShare extends StatefulWidget {
  const LineChartgraphShare({Key? key}) : super(key: key);

  @override
  _LineChartgraphShareState createState() => _LineChartgraphShareState();
}

class _LineChartgraphShareState extends State<LineChartgraphShare> {
  // crate list of spots for the graph by monthly, yearly of Google Stocks
  List<FlSpot> _daylySpots = [
    FlSpot(0, 20.0),
    FlSpot(1, 20.0),
    FlSpot(2, 30.0),
    FlSpot(3, 10.0),
    FlSpot(4, 40.0),
    FlSpot(5, 60.0),
    FlSpot(6, 40.0),
    FlSpot(7, 80.0),
    FlSpot(8, 60.0),
    FlSpot(9, 70.0),
    FlSpot(10, 50.0),
    FlSpot(11, 150.0),
    FlSpot(12, 70.0),
    FlSpot(13, 80.0),
    FlSpot(14, 60.0),
    FlSpot(15, 70.0),
    FlSpot(16, 60.0),
    FlSpot(17, 80.0),
    FlSpot(18, 110.0),
    FlSpot(19, 130.0),
    FlSpot(20, 100.0),
    FlSpot(21, 130.0),
    FlSpot(22, 160.0),
    FlSpot(23, 190.0),
    FlSpot(24, 150.0),
    FlSpot(25, 170.0),
    FlSpot(26, 180.0),
    FlSpot(27, 140.0),
    FlSpot(28, 150.0),
    FlSpot(29, 150.0),
    FlSpot(30, 130.0)
  ];

  List<FlSpot> _monthlySpots = [
    FlSpot(0, 110.0),
    FlSpot(1, 110.0),
    FlSpot(2, 130.0),
    FlSpot(3, 100.0),
    FlSpot(4, 130.0),
    FlSpot(5, 160.0),
    FlSpot(6, 190.0),
    FlSpot(7, 150.0),
    FlSpot(8, 170.0),
    FlSpot(9, 180.0),
    FlSpot(10, 140.0),
    FlSpot(11, 150.0),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        FadeInUp(
          duration: Duration(milliseconds: 1000),
          from: 60,
          child: Container(
              height: (MediaQuery.of(context).size.width > phoneSize) ? 30 : 15,
              child: LineChart(
                mainData(),
                swapAnimationCurve: Curves.easeInOutCubic,
                swapAnimationDuration: Duration(milliseconds: 1000),
              )),
        ),
      ]),
    );
  }

  // Charts Data
  List<Color> gradientColors = [
    Colors.blue,
    Colors.blue,
  ];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: false, horizontalInterval: 1.6, drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: false,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 8),
          getTitles: (value) {
            if (_currentIndex == 0) {
              // Assuming daily data
              switch (value.toInt()) {
                case 1:
                  return '0';
                case 2:
                  return '1';

                case 3:
                  return '3';
                case 4:
                  return '4';
                case 5:
                  return '5';
                case 6:
                  return '6';
                case 7:
                  return '7';
                case 8:
                  return '8';
                case 9:
                  return '9';
                case 10:
                  return '10';
                case 11:
                  return '11';
                case 12:
                  return '12';
                case 13:
                  return '13';
                case 14:
                  return '14';
                case 15:
                  return '15';
                case 16:
                  return '16';
                case 17:
                  return '17';
                case 18:
                  return '18';
                case 19:
                  return '19';
                case 20:
                  return '20  ';
                case 21:
                  return '21';
                case 22:
                  return '22';
                case 23:
                  return '23';
                case 24:
                  return '24';
                case 25:
                  return '25';
                case 26:
                  return '26';

                case 27:
                  return '27';
                case 28:
                  return '28';
                case 29:
                  return '29  ';
                case 30:
                  return '30';
                // Add more cases as needed
              }
            } else if (_currentIndex == 1) {
              // Assuming monthly data
              switch (value.toInt()) {
                case 1:
                  return 'JAN';
                case 2:
                  return 'FEB';
                case 3:
                  return 'MAR';
                case 4:
                  return 'APR';
                case 5:
                  return 'MAY';
                case 6:
                  return 'JUN';
                case 7:
                  return 'JUL';
                case 8:
                  return 'AUG';
                case 9:
                  return 'SEP';
                case 10:
                  return 'OCT';
                case 11:
                  return 'NOV';
                case 12:
                  return 'DEC';
              }
            } else if (_currentIndex == 2) {
              // Assuming yearly data
              return '${(value + 10).toInt()}';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _currentIndex == 0
              ? _daylySpots
              : _currentIndex == 1
                  ? _monthlySpots
                  : _daylySpots,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: false,
              gradientFrom: Offset(0, 0),
              gradientTo: Offset(0, 1),
              colors: [
                Colors.blue.withOpacity(0.1),
                Colors.blue.withOpacity(0),
              ]),
        )
      ],
    );
  }
}
