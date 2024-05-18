import 'package:flutter/material.dart';
import 'package:ssen_user/Models/why_invest.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';

// class HorizontalScrollableWhyInvest extends StatelessWidget {
//   final List<ScrollableItem> items = [
//     ScrollableItem(
//       title: 'Benefits',
//       description:
//           'Ethiopian music is as diverse as its population, each ethnic group has its own sound and typical style. On top of widely popular',
//     ),
//     // ScrollableItem(
//     //   title: 'Divident',
//     //   description:
//     //       'Ethiopian music is as diverse as its population, each ethnic group has its own sound and typical style. On top of widely popular',
//     // ),

//     // ScrollableItem(
//     //   title: 'Director ',
//     //   description:
//     //       'Ethiopian music is as diverse as its population, each ethnic group has its own sound and typical style. On top of widely popular',
//     // ),
//     // Add more items as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             child: Text(
//               "Why Invest?",
//               style: dark
//                   ? STextTheme.darkTextTheme.headlineSmall
//                   : STextTheme.lightTextTheme.headlineSmall,
//             ),
//           ),
//           const SizedBox(
//             height: SSizes.iconXS,
//           ),
//           SizedBox(
//             height: 100.0, // Adjust the height as needed
//             width: double.infinity,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return ScrollableListItem(item: items[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ScrollableItem {
//   final String title;
//   final String description;

//   ScrollableItem({required this.title, required this.description});
// }

// class ScrollableListItem extends StatelessWidget {
//   final ScrollableItem item;

//   ScrollableListItem({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return ScrollableItemWidget(item: item);
//   }
// }

// class ScrollableItemWidget extends StatelessWidget {
//   final ScrollableItem item;

//   ScrollableItemWidget({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     return Container(
//       width: 200,
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       padding: const EdgeInsets.all(15.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(14),
//         border: Border.all(
//             width: 1, color: Colors.grey), // Adjust border properties as needed
//       ),
//       child: ListView(
//         children: [
//           Text(item.title,
//               style: dark
//                   ? STextTheme.darkTextTheme.headlineSmall
//                   : STextTheme.lightTextTheme.headlineSmall),
//           Text(
//             maxLines:
//                 2, // Adjust the number of lines you want to show initially
//             overflow: TextOverflow.ellipsis,
//             item.description,
//             style: dark
//                 ? STextTheme.darkTextTheme.bodySmall
//                 : STextTheme.lightTextTheme.bodySmall,
//           ),
//         ],
//       ),
//     );
//   }
// }
class HorizontalScrollableWhyInvest extends StatelessWidget {
  const HorizontalScrollableWhyInvest({Key? key, required this.whyinvests})
      : super(key: key);
  final List<WhyInvestModel> whyinvests;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [IndividualWhyInvest(whyInvest: whyinvests[0])],
    );
  }
}

class IndividualWhyInvest extends StatelessWidget {
  const IndividualWhyInvest({Key? key, required this.whyInvest})
      : super(key: key);
  final WhyInvestModel whyInvest;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            width: 1, color: Colors.grey), // Adjust border properties as needed
      ),
      child: ListView(
        children: [
          Text(whyInvest.title,
              style: dark
                  ? STextTheme.darkTextTheme.headlineSmall
                  : STextTheme.lightTextTheme.headlineSmall),
          Text(
            maxLines:
                2, // Adjust the number of lines you want to show initially
            overflow: TextOverflow.ellipsis,
            whyInvest.description,
            style: dark
                ? STextTheme.darkTextTheme.bodySmall
                : STextTheme.lightTextTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
