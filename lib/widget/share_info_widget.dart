import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants/colors.dart';

class ShareInfoWidget extends StatelessWidget {
  const ShareInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: SColors.lighGrey,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Habesha Breweries S.C",
                style: STextTheme.lightTextTheme.headlineSmall),
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
                const Text(
                  "Dec 01/2023",
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
                const Text(
                  "500 shares bought",
                  // style: STextTheme.lightTextTheme.bodySmall
                  //     ?.copyWith(color: Colors.blue),
                  style: TextStyle(fontSize: 13, color: Colors.blue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
