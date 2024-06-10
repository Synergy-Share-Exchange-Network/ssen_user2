import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ssen_user/Models/company_profile_model.dart';

import '../../../widget/analytics/graph1.dart';
import '../../../widget/analytics/graph_circular.dart';

class AnalysisCompany extends StatelessWidget {
  final CompanyProfileModel company;
  const AnalysisCompany({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LineChartgraph(id: company.identification),
          CircularIndicator(
            company: company,
            radius: 10.0,
          )
        ],
      ),
    );
  }
}
