import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/purchase_model.dart';
import 'package:ssen_user/screens/partial%20screen/process%20requests/payment__waiting.dart';

import '../../Models/user_model.dart';
import '../../Repository/firebase/key words/collection_name.dart';
import '../../provider/user_provider.dart';
import '../../services/theme/text_theme.dart';
import '../../utils/constants.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/navbar.dart';
import '../../utils/helper_function.dart';

import '../partial screen/process requests/Payment_pending_request.dart';
import '../partial screen/process requests/payment_verified.dart';
import '../partial screen/process requests/request_history.dart';

class ProcessPage extends StatelessWidget {
  const ProcessPage({super.key});
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer:
            (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor:
                dark ? SColors.darkContainer : SColors.lightContainer,
            elevation: 0,
            centerTitle: true,
            bottom: (MediaQuery.of(context).size.width > phoneSize)
                ? TabBar(
                    labelColor: dark ? SColors.white : SColors.black,
                    tabs: [
                      Tab(
                        child: Text(
                          "Pending",
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // Make text bold
                        ),
                      ),
                      Tab(
                        child: Text(
                          "waiting payment",
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // Make text bold
                        ),
                      ),
                      Tab(
                        child: Text(
                          "waiting Vefication",
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // Make text bold
                        ),
                      ),
                      Tab(
                        child: Text(
                          "History",
                          style: TextStyle(
                              fontWeight: FontWeight.bold), // Make text bold
                        ),
                      ),
                    ],
                  )
                : TabBar(
                    labelColor: dark ? SColors.white : SColors.black,
                    tabs: [
                      Tab(
                        child: Text(
                          "Pending",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12), // Make text bold
                        ),
                      ),
                      Tab(
                        child: Text(
                          "waiting payment",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12), // Make text bold
                        ),
                      ),
                      Tab(
                        child: Text(
                          "waiting Vefication",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12), // Make text bold
                        ),
                      ),
                      Tab(
                        child: Text(
                          "History",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12), // Make text bold
                        ),
                      ),
                    ],
                  )),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(CollectionName.purchase)
                .orderBy('date', descending: true)
                .where('userID', isEqualTo: user.identification)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<PurchaseModel> purchases =
                  snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return PurchaseModel.fromMap(data);
              }).toList();
              // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
              // print(purchases);
              // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

              List<PurchaseModel> pendingRequest = [];
              List<PurchaseModel> waitingVerifyUser = [];
              List<PurchaseModel> waitingpayment = [];
              List<PurchaseModel> historyPurchase = [];
              for (var purchase in purchases) {
                if (purchase.successfullyBought.isEmpty) {
                  if (purchase.acceptedPayment.isNotEmpty) {
                    if (purchase.acceptedPayment[0] == 'false') {
                      historyPurchase.add(purchase);
                    } else {
                      waitingVerifyUser.add(purchase);
                    }
                  } else if (purchase.requestAccepted.isNotEmpty) {
                    if (purchase.requestAccepted[0] == 'false') {
                      historyPurchase.add(purchase);
                    } else {
                      waitingpayment.add(purchase);
                    }
                  } else if (purchase.requestSent.isNotEmpty) {
                    if (purchase.requestSent[0] == 'false') {
                      historyPurchase.add(purchase);
                    } else {
                      pendingRequest.add(purchase);
                    }
                  }
                }
              }
              // print("jjjjjjjjj");
              // print(purchases[0].acceptedPayment);
              // print(pendingRequest.length);
              // print(waitingpayment.length);
              // print(waitingVerifyUser.length);
              // print(historyPurchase.length);
              // print("jjjjjjjjj");

              return TabBarView(children: [
                PaymentPendingRequest(
                  purchases: pendingRequest,
                ),
                PaymentVerified(
                  purchases: waitingpayment,
                ),
                PaymentWaitingRequest(purchases: waitingVerifyUser),
                RequestHistory(
                  purchases: historyPurchase,
                )
              ]);
            }),
      ),
    );
  }
}
