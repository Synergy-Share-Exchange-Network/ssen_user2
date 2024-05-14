import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.4),
          borderRadius: BorderRadius.all(Radius.circular(7))),
      // color: Colors.pink,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('asset/logo_image/goat.jpg'),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Habesha Breweries S.c",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        // color: Colors.black,
                        size: 12,
                      ),
                      Text("Addis Ababa, Ethiopia",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.clock,
                        color: Colors.grey,
                        size: 10,
                      ),
                      Text(
                        "Dec01/2023",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
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


// class SubscriptionWidget extends StatelessWidget {
//   const SubscriptionWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 88,
//     );
//   }
// }
