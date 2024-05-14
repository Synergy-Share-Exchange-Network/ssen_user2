import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/utils/constants/colors.dart';

class ShareDetailElementWidget extends StatelessWidget {
  const ShareDetailElementWidget({
    Key? key,
    required this.title1,
    required this.content,
    required this.contentPrice,
    required this.title2,
    required this.content2,
    required this.contentPrice2,

    // required this.function,
  }) : super(key: key);
  final String title1;
  final String content;
  final String contentPrice;
  final String title2;
  final String content2;
  final String contentPrice2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              elevation: 0.5,
              color: SColors.lighGrey,
              child: Container(
                height: 80,
                width: 180,
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Iconsax.dollar_circle,
                      // color: Colors.black,
                      size: 17,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title1,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          content,
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          contentPrice,
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          SizedBox(
            width: 7,
          ),
          Card(
            elevation: 0.5,
            color: SColors.lighGrey,
            child: Container(
              height: 80,
              width: 180,
              margin: EdgeInsets.only(left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Iconsax.dollar_circle,
                    // color: Colors.black,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        content2,
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        contentPrice2,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
