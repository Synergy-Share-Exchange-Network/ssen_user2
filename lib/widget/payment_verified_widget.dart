import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/firebase_purchase_service_method.dart';

import '../../services/theme/text_theme.dart';

import '../Models/purchase_model.dart';

import '../screens/request_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class PaymentVerifiedWidget extends StatelessWidget {
  const PaymentVerifiedWidget({Key? key, required this.purchase})
      : super(key: key);
  final PurchaseModel purchase;

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return InkWell(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RequestDetail(
                  purchase: purchase,
                )));
      }),
      child: Container(
        height: 110,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: dark ? SColors.darkContainer : SColors.lightContainer,
          border: Border.all(
            width: 1,
            color: dark ? Colors.black : Colors.white,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${purchase.firstName} ${purchase.lastName}",
                        style: dark
                            ? STextTheme.darkTextTheme.headlineSmall
                            : STextTheme.lightTextTheme.headlineSmall),
                    Row(
                      children: [
                        Text(
                          'Total Amount :${purchase.numberOfShare * purchase.sharePerPrice + 5 / 100 * purchase.numberOfShare * purchase.sharePerPrice} Birr',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    TextEditingController transactionNumberController =
                        TextEditingController();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Verify Payment'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: transactionNumberController,
                                decoration: InputDecoration(
                                    hintText: "Enter Trasaction number"),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                FirebasePurchaseServiceMethod()
                                    .finshPurchasePayment(
                                        purchase,
                                        transactionNumberController.text.trim(),
                                        true,
                                        'reason');
                                Navigator.of(context).pop(); // Close the dialog
                                // Close the dialog
                              },
                              child: Text('Submit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Accept'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    TextEditingController reasonController =
                        TextEditingController();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Decline Reason'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: reasonController,
                                decoration:
                                    InputDecoration(hintText: "Enter Reason"),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                FirebasePurchaseServiceMethod()
                                    .finshPurchasePayment(
                                        purchase,
                                        '',
                                        false,
                                        reasonController.text
                                            .trim()); // Close the dialog
                              },
                              child: Text('Submit'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('Decline'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
