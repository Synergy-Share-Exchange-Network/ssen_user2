import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/Models/purchase_model.dart';
import 'package:ssen_user/widget/payment_waiting_widget.dart';

import '../../../widget/payment_pending_request_widget.dart';

class PaymentWaitingRequest extends StatelessWidget {
  const PaymentWaitingRequest({Key? key, required this.purchases})
      : super(key: key);
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
                  return PaymentWaitingtWidget(purchase: purchase);
                }).toList(),
              ),
      ),
    );
  }
}
