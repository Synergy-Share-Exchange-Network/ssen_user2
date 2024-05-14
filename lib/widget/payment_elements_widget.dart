import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/utils/constants/colors.dart';

class PaymentElementWidget extends StatelessWidget {
  const PaymentElementWidget(
      {Key? key, required this.bankname, required this.bankaccount})
      : super(key: key);

  final String bankname;
  final String bankaccount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0.5,
            color: Color.fromARGB(255, 255, 250, 250),
            child: Container(
              height: 120,
              width: 170,
              margin: EdgeInsets.only(left: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage("asset/logo_image/Stock.jpg"),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      child: Text(
                        bankname,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      child: Text(
                        bankaccount,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
