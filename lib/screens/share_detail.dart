import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/screens/partial%20screen/purchase.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/widget/share_detail_element_widget.dart';

import '../widget/analytics/graph1.dart';

class ShareDetail extends StatelessWidget {
  const ShareDetail({Key? key, required this.company, required this.share})
      : super(key: key);
  final CompanyProfileModel company;
  final ShareModel share;

  @override
  Widget build(BuildContext context) {
    ShareModel share = ShareModel(
      savingAccountPercentage: 20.0,
      proclamationNumber: "proclamation number: 45363829836345",
      minimumNumberOfBuyer: 23,
      maximumNumberOfBuyer: 15,
      bankInformation: ['bankInfo1', 'bankInfo2'],
      shareImage: ["asset/logo_image/Stock.jpg"],
      unitSharePrice: 67.0,
      noOfShares: 50.0,
      divident: 60.0,
      minimumPaymentInPercent: 10.0,
      minimumNumberOfSharesToBuy: 9.0,
      maximumNumberOfSharesToBuy: 15.0,
      requirement: "requirement",
      description:
          "Habesha Breweries S.C Founded by 8,000 proud Ethiopian shareholders who were moved by the vision of reaching and connecting with Ethiopians, Habesha Breweries.",
      searchKeyWords: ['bankInfo1', 'bankInfo2'],
      timeToReturnRemainPayment: 20,
    );
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
          'Share Detail',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: (MediaQuery.of(context).size.width > phoneSize)
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                AssetImage('asset/logo_image/goat.jpg'),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Container(
                          child: Text(
                            company.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Iconsax.location,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              company.locationDescription,
                              // style: STextTheme.lightTextTheme.bodySmall
                              //     ?.copyWith(color: Colors.blue),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              Iconsax.location,
                              color: Colors.grey,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              company.lineOfBusiness,
                              // style: STextTheme.lightTextTheme.bodySmall
                              //     ?.copyWith(color: Colors.blue),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            share.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (share.shareImage[0] != '')
                            ? Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(share.shareImage[0]))),
                              )
                            : Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(share.shareImage[0]))),
                              ),
                      ],
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            ShareDetailElementWidget(
                              title1: 'unit Share Price ',
                              content: 'ETB(birr)',
                              contentPrice: '${share.unitSharePrice}',
                              title2: 'Number of buyers',
                              content2: '${share.maximumNumberOfBuyer}',
                              contentPrice2: '${share.minimumNumberOfBuyer}',
                            ),
                            ShareDetailElementWidget(
                              title1: 'number of shares',
                              content: '${share.noOfShares}',
                              contentPrice: '200 units',
                              title2: 'Divident  ',
                              content2: '${share.divident}',
                              contentPrice2: '${share.bankInformation}',
                            ),
                            ShareDetailElementWidget(
                              title1: 'minimum payment ',
                              content: '${share.minimumPaymentInPercent}',
                              contentPrice: 'half of the share price',
                              title2: 'number of share to buy ',
                              content2: '${share.maximumNumberOfSharesToBuy}',
                              contentPrice2:
                                  '${share.minimumNumberOfSharesToBuy}',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 550,
                              child: Text(
                                share.proclamationNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 550,
                              child: const Text(
                                "saving account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 550,
                              child: const Text(
                                "requirment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Iconsax.tick_circle,
                              // color: Colors.black,
                              size: 12,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 550,
                              child: const Text(
                                "time to return remain payment",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Iconsax.arrow_down_14,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage:
                            AssetImage('asset/logo_image/goat.jpg'),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      child: Text(
                        company.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Iconsax.location,
                          color: Colors.grey,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          company.locationDescription,
                          // style: STextTheme.lightTextTheme.bodySmall
                          //     ?.copyWith(color: Colors.blue),
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Iconsax.location,
                          color: Colors.grey,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          company.lineOfBusiness,
                          // style: STextTheme.lightTextTheme.bodySmall
                          //     ?.copyWith(color: Colors.blue),
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        share.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(share.shareImage[0]))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        ShareDetailElementWidget(
                          title1: 'unit Share Price ',
                          content: 'ETB(birr)',
                          contentPrice: '${share.unitSharePrice}',
                          title2: 'Number of buyers',
                          content2: '${share.maximumNumberOfBuyer}',
                          contentPrice2: '${share.minimumNumberOfBuyer}',
                        ),
                        ShareDetailElementWidget(
                          title1: 'number of shares',
                          content: '${share.noOfShares}',
                          contentPrice: '200 units',
                          title2: 'Divident  ',
                          content2: '${share.divident}',
                          contentPrice2: '${share.bankInformation}',
                        ),
                        ShareDetailElementWidget(
                          title1: 'minimum payment ',
                          content: '${share.minimumPaymentInPercent}',
                          contentPrice: 'half of the share price',
                          title2: 'number of share to buy ',
                          content2: '${share.maximumNumberOfSharesToBuy}',
                          contentPrice2: '${share.minimumNumberOfSharesToBuy}',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.tick_circle,
                          // color: Colors.black,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: Text(
                            share.proclamationNumber,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.tick_circle,
                          // color: Colors.black,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: const Text(
                            "saving account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Iconsax.arrow_down_14,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.tick_circle,
                          // color: Colors.black,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: const Text(
                            "requirment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Iconsax.arrow_down_14,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Iconsax.tick_circle,
                          // color: Colors.black,
                          size: 12,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 70,
                          child: const Text(
                            "time to return remain payment",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Iconsax.arrow_down_14,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // LineChartgraph(),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(3)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Purchase())));
                              },
                              child: const Center(
                                child: Text("BUY",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
