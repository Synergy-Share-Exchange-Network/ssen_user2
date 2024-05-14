import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/widget/donation_widget.dart';

class Donation extends StatelessWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DonationWidget(),
            DonationWidget(),
            DonationWidget(),
            DonationWidget(),
            DonationWidget(),
            DonationWidget(),
            DonationWidget(),
            DonationWidget(),
            DonationWidget(),
            DonationWidget(),
          ],
        ),
      ),
    );
  }
}
