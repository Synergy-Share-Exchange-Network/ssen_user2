import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/secondry_post_share.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/widget/secondary_profile_widget.dart';

import '../../Models/user_model.dart';
import '../../Repository/firebase/key words/collection_name.dart';

class Secondary extends StatelessWidget {
  const Secondary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(CollectionName.secondary)
              .orderBy('date', descending: true)
              // .where('userID', isEqualTo: user.identification)
              .where('doesItPassTheCriteria', isEqualTo: ['true']).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<SecondryPostShareModel> seconderies =
                snapshot.data!.docs.map((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return SecondryPostShareModel.fromMap(data);
            }).toList();

            // for (var secondary in seconderies) {
            //   print(secondary);
            //   print(secondary.sellerID == user.identification);
            //   if (secondary.sellerID == user.identification) {
            //     seconderies.remove(secondary);
            //   }
            //   print(seconderies.length);
            // }
            return SingleChildScrollView(
              child: (seconderies.isEmpty)
                  ? Center(
                      child: Text("No Data"),
                    )
                  : Column(
                      children: seconderies.map((secondary) {
                        return StreamBuilder<
                                DocumentSnapshot<Map<String, dynamic>>>(
                            stream: FirebaseFirestore.instance
                                .collection(CollectionName.organization)
                                .doc(secondary.companyID)
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
                                      .collection(CollectionName.user)
                                      .doc(secondary.sellerID)
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

                                    UserModel user2 = UserModel.fromMap(
                                        snapshot.data?.data()
                                            as Map<String, dynamic>);
                                    return SecondaryProfileWidget(
                                        secondary: secondary,
                                        company: company,
                                        user: user2);
                                  });
                            });
                      }).toList(),
                    ),
            );
          }),
    );
  }
}
