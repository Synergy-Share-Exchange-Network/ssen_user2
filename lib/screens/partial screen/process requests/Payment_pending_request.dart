import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../widget/payment_pending_request_widget.dart';

class PaymentPendingRequest extends StatelessWidget {
  const PaymentPendingRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [PaymentPendingRequestWidget()],
      ),
    ));
  }
}
