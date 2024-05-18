import 'package:flutter/material.dart';

import '../../Models/company_profile_model.dart';

class CompanyNews extends StatelessWidget {
  const CompanyNews({super.key, required this.company});
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('News'),
      ),
    );
  }
}
