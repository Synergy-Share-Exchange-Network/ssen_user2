import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/Models/purchase_model.dart';

import '../../../widget/payment_verified_widget.dart';

class PaymentVerified extends StatelessWidget {
  const PaymentVerified({Key? key, required this.purchases}) : super(key: key);
  final List<PurchaseModel> purchases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: (purchases.isEmpty)
            ? Center(
                child: Text("No Data"),
              )
            : Column(
                children: purchases.map((purchase) {
                  return PaymentVerifiedWidget(
                    purchase: purchase,
                  );
                }).toList(),
              ),
      ),
    );
  }
}
