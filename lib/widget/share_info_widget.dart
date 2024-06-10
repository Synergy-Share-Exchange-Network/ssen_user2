import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/company_requirement_on_secondry_market_model.dart';
import 'package:ssen_user/Models/purchase_model.dart';
import 'package:ssen_user/Models/secondry_post_share.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/secondary%20purchase/firebase_secondary_purchase_buy_service_method.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/secondary%20purchase/firebase_secondary_purchase_sell_service_method.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/utils.dart';

class ShareInfoWidget extends StatelessWidget {
  const ShareInfoWidget({
    Key? key,
    required this.purchase,
    required this.company,
    required this.req,
  }) : super(key: key);
  final PurchaseModel purchase;
  final CompanyProfileModel company;
  final CompanyRequirementOnSecondryMarketModel req;

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return Card(
      elevation: 0.5,
      color: SColors.lighGrey,
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(5),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 3),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  getImage(user.profilePicture[0])))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("${user.firstName} ${user.lastName}")
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  company.name,
                ),
                // style: STextTheme.lightTextTheme.headlineSmall),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Iconsax.clock,
                      color: Colors.blue,
                      size: 13,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      purchase.date,
                      // style: STextTheme.lightTextTheme.bodySmall
                      //     ?.copyWith(color: Colors.blue),
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Iconsax.dollar_circle,
                      color: Colors.blue,
                      size: 13,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${purchase.numberOfShare} Share bought",
                      // style: STextTheme.lightTextTheme.bodySmall
                      //     ?.copyWith(color: Colors.blue),
                      style: TextStyle(fontSize: 13, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  TextEditingController numberOfShareController =
                      TextEditingController();
                  TextEditingController pricePerShareContoller =
                      TextEditingController();

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Secondary Post'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: numberOfShareController,
                              decoration:
                                  InputDecoration(hintText: "Number of Share "),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              controller: pricePerShareContoller,
                              decoration:
                                  InputDecoration(hintText: "Share Per Price"),
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
                            onPressed: () async {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  content: Container(
                                    padding: EdgeInsets.all(20),
                                    height: 125,
                                    child: Column(
                                      children: const [
                                        CircularProgressIndicator(),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Posting ..."),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                              SecondryPostShareModel secondaryPost =
                                  SecondryPostShareModel(
                                      numberOfShare: int.parse(
                                          numberOfShareController.text.trim()),
                                      pricePerShare: double.parse(
                                          pricePerShareContoller.text.trim()));

                              String res =
                                  await FirebaseSecondaryPurchaseSellServiceMethod()
                                      .createSecondaryMarketSell(purchase,
                                          secondaryPost, user, req, company);
                              // print("ooooooooooooooooooooooooooooooooooooooo");
                              // print(res);
                              // .createSecondaryMarketBuy(
                              //     secondary, share, user, purchase);
                              Navigator.pop(context);
                              if (res == "success") {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    content: Container(
                                      padding: EdgeInsets.all(20),
                                      height: 105,
                                      child: Column(
                                        children: [
                                          const Text(
                                              "Succesfully Posted Share."),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                // await FlutterSecureStorageEmailAndPasswordMethod()
                                                //     .signInUsingLocalData();
                                                // Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                // Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.green),
                                              child: const Text("   Okay   "))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    content: Container(
                                      padding: EdgeInsets.all(20),
                                      height: 125,
                                      child: Column(
                                        children: [
                                          Text("Error: $res",
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                // await FlutterSecureStorageEmailAndPasswordMethod()
                                                //     .signInUsingLocalData();
                                                // Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red),
                                              child: const Text("   Okay   "))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text('Sell'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('      Sell      '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
