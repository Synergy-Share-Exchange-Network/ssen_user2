import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ssen_user/widget/payment_elements_widget.dart';

class Payment_preview extends StatelessWidget {
  const Payment_preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 176, 217, 252)),
                child: const Text(
                  "Habesha Breweries S.C",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: const Text(
                  "Date: 02/14/2024 ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: const Text(
                  "Hey Birhan , ",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: const Text(
                  "An invoice has been generated on your account for the amount of br 60000 which is due on 02/14/2024. ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: const Text(
                  "Invoiced Service",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: const Text(
                  "domain services: birhanmulugeta34@gmail.com (02/14/2024)",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: const Text(
                  "Make payment",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const PaymentElementWidget(
                        bankname: "CBE", bankaccount: "10004567889"),
                    const PaymentElementWidget(
                        bankname: "telebirr", bankaccount: "1000096473445"),
                    const PaymentElementWidget(
                        bankname: "BoA", bankaccount: "876378583"),
                    const PaymentElementWidget(
                        bankname: "Awash", bankaccount: "76375683793"),
                    const PaymentElementWidget(
                        bankname: "dashen", bankaccount: "474678789379"),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: const Text(
                  "confirm Payment",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                child: const Text(
                  "after making the transfer please click the button to confirm your payment ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 40,
                width: 250,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 176, 217, 252)),
                child: const Text(
                  "confirm your payment",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
