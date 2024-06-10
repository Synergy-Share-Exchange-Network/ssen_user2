import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/secondry_post_share.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/widget/secondary_profile_widget.dart';

class OwenSecondary extends StatelessWidget {
  const OwenSecondary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Secondary Post"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection(CollectionName.secondary)
              .orderBy('date', descending: true)
              .where('sellerID', isEqualTo: user.identification)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            List<SecondryPostShareModel> secondaries =
                snapshot.data!.docs.map((document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return SecondryPostShareModel.fromMap(data);
            }).toList();
            return SingleChildScrollView(
              child: (secondaries.isEmpty)
                  ? Center(
                      child: Text("No Data"),
                    )
                  : Column(
                      children: secondaries.map((secondary) {
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
                              return SecondaryProfileWidget(
                                company: company,
                                secondary: secondary,
                                user: user,
                              );
                            });
                      }).toList(),
                    ),
            );
          }),
    );
  }
}
