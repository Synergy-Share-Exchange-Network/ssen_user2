import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/company_requirement_on_secondry_market_model.dart';
import 'package:ssen_user/Models/purchase_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/widget/share_info_widget.dart';

import '../Repository/firebase/key words/collection_name.dart';

class Assets extends StatelessWidget {
  static const route = "assets";
  const Assets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.blue,
              size: 20,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Assets ',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(CollectionName.purchase)
              .orderBy('date', descending: true)
              .where('userID', isEqualTo: user.identification)
              .where('isSucessfull', isEqualTo: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<PurchaseModel> purchases = snapshot.data!.docs.map((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return PurchaseModel.fromMap(data);
            }).toList();
            // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
            // print(purchases);
            // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

            return SingleChildScrollView(
              child: (purchases.isEmpty)
                  ? const Center(
                      child: Text("No Data"),
                    )
                  : Column(
                      children: purchases.map((purchase) {
                        return StreamBuilder<
                                DocumentSnapshot<Map<String, dynamic>>>(
                            stream: FirebaseFirestore.instance
                                .collection(CollectionName.organization)
                                .doc(purchase.companyID)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                return Text('Error: ${snapshot.error}');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                ); // Loading indicator while data is loading.
                              }

                              CompanyProfileModel company =
                                  CompanyProfileModel.fromMap(snapshot.data
                                      ?.data() as Map<String, dynamic>);
                              return StreamBuilder<
                                      DocumentSnapshot<Map<String, dynamic>>>(
                                  stream: FirebaseFirestore.instance
                                      .collection(
                                          CollectionName.companySecondaryReq)
                                      .doc(company.userRequirment)
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      print(snapshot.error);
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      ); // Loading indicator while data is loading.
                                    }

                                    CompanyRequirementOnSecondryMarketModel
                                        req =
                                        CompanyRequirementOnSecondryMarketModel
                                            .fromMap(snapshot.data?.data()
                                                as Map<String, dynamic>);

                                    return ShareInfoWidget(
                                      purchase: purchase,
                                      company: company,
                                      req: req,
                                    );
                                  });
                            });
                      }).toList(),
                    ),
            );
          }),
    );
  }
}
