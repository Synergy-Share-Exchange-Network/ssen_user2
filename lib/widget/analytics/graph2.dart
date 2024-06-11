import 'dart:async';
import 'dart:math'; // Import for double.parse

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Models/company_profile_model.dart';

class PercentIndicator extends StatefulWidget {
  const PercentIndicator({
    Key? key,
    required this.company,
    required this.lineheight,
  }) : super(key: key);
  final CompanyProfileModel company;
  final double lineheight;
  @override
  _PercentIndicatorState createState() => _PercentIndicatorState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<double> fetchData(String id) async {
  try {
    DocumentSnapshot primaryDoc = await _firestore
        .collection('ML_data')
        .doc('companies')
        .collection(id)
        .doc('primary')
        .get();
    print('1');

    if (primaryDoc.exists) {
      Map<String, dynamic>? data = primaryDoc.data() as Map<String, dynamic>?;
      if (data != null) {
        List<dynamic> dates = data['date'] ?? [];
        List<dynamic> seles = data['seles'] ?? [];
        if (dates.length == seles.length) {
          double totalSales = 0.0;
          for (var element in seles) {
            totalSales += double.parse(
                element.toString()); // Handle potential non-String numerics
          }
          return totalSales;
        } else {
          print('Mismatch in length between dates and seles');
          return 0.0; // Or handle mismatch differently (e.g., throw exception)
        }
      } else {
        print('No data found in primary document.');
        return 0.0;
      }
    } else {
      print('Primary document does not exist.');
      return 0.0;
    }
  } catch (e) {
    print('Error fetching data: $e');
    return 0.0; // Or handle error differently (e.g., throw exception)
  }
}

Future<double> fetchShareQuant(String id) async {
  try {
    DocumentSnapshot shareDoc =
        await _firestore.collection('share').doc(id).get();

    if (shareDoc.exists) {
      Map<String, dynamic>? data = shareDoc.data() as Map<String, dynamic>?;
      if (data != null && data['totalNumberOfShares'] != null) {
        return double.parse(data['totalNumberOfShares'].toString());
      } else {
        print('No shareQuant found in document.');
        return 0.0;
      }
    } else {
      print('Share document does not exist.');
      return 0.0;
    }
  } catch (e) {
    print('Error fetching share data: $e');
    return 0.0; // Or handle error differently (e.g., throw exception)
  }
}

class _PercentIndicatorState extends State<PercentIndicator> {
  String? id;
  String? id2;
  double totalSales = 0.0;
  double shareQuant = 0.0;

  @override
  void initState() {
    super.initState();

    id = widget.company.identification;

    id2 = widget.company.shareID;
    // id = 'NKkRUGqVFDUYi6qTMWrhOlctHmT2';

    fetchData(id!).then((salesValue) {
      fetchShareQuant(id2!).then((shareValue) {
        setState(() {
          totalSales = salesValue;
          shareQuant = shareValue;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double parsedTotal = double.parse(totalSales.toString()) / shareQuant;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LinearPercentIndicator(
          animation: true,
          animationDuration: 1000,
          lineHeight: widget.lineheight,
          percent: parsedTotal,
          progressColor: Colors.green,
          backgroundColor: Colors.green.shade100,
        )
      ],
    );
  }
}
