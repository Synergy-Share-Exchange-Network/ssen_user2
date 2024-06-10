import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../services/theme/text_theme.dart';

import '../Models/purchase_model.dart';

import '../screens/request_detail.dart';
import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class PaymentWaitingtWidget extends StatelessWidget {
  const PaymentWaitingtWidget({Key? key, required this.purchase})
      : super(key: key);
  final PurchaseModel purchase;

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RequestDetail(
                  purchase: purchase,
                )));
      },
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
                          'No of Share : ${purchase.numberOfShare.toString()}',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.money,
                              color: Colors.blue,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "${purchase.payedamount.toString()}",
                              style: dark
                                  ? STextTheme.darkTextTheme.bodySmall
                                  : STextTheme.lightTextTheme.bodySmall,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.date_range,
                              color: Colors.blue,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              "${purchase.date}",
                              style: dark
                                  ? STextTheme.darkTextTheme.bodySmall
                                  : STextTheme.lightTextTheme.bodySmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
