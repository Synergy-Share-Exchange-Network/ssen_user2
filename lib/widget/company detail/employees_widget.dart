// import 'package:flutter/material.dart';
// import 'package:ssen_user/Models/key_figure_model.dart';
// import 'package:ssen_user/services/theme/text_theme.dart';
// import 'package:ssen_user/utils/constants/image_Strings.dart';

// import '../../utils/constants/size.dart';
// import '../../utils/helper_function.dart';

// class HorizontalScrollableEmployeeList extends StatelessWidget {
//   final List<ScrollableItem> items = [
//     ScrollableItem(
//       image: SImages.empolyee1,
//       title: 'CEO',
//       description: 'Manage and control 1',
//     ),
//     ScrollableItem(
//       image: SImages.employee2,
//       title: 'Supervisor',
//       description: 'Description 2',
//     ),

//     ScrollableItem(
//       image: SImages.employee3,
//       title: 'Director ',
//       description: 'Description 2',
//     ),
//     // Add more items as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final dark = SHelperFunction.isDarkMode(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             child: Text(
//               "Key Figures",
//               style: dark
//                   ? STextTheme.darkTextTheme.headlineSmall
//                   : STextTheme.lightTextTheme.headlineSmall,
//             ),
//           ),
//           SizedBox(
//             height: SSizes.iconXS,
//           ),
//           Container(
//             height: 180.0,
//             width: double.infinity,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: items.length,
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
//   final String image;
//   final String title;
//   final String description;

//   ScrollableItem(
//       {required this.image, required this.title, required this.description});
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
//     return Container(
//       // decoration: BoxDecoration(
//       //   color: Colors.white,
//       //   borderRadius: BorderRadius.circular(8.0),
//       //   border: Border.all(color: Colors.black),
//       // ),
//       width: 150.0,
//       margin: EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 50.0,
//             backgroundImage: AssetImage(item.image),
//           ),
//           SizedBox(height: 8.0),
//           Text(
//             item.title,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16.0,
//                 color: Colors.blue),
//           ),
//           SizedBox(height: 4.0),
//           Text(
//             item.description,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ssen_user/Models/key_figure_model.dart';
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
class HorizontalScrollableKeyFigure extends StatelessWidget {
  const HorizontalScrollableKeyFigure({Key? key, required this.keyfigure})
      : super(key: key);
  final List<KeyFigureModel> keyfigure;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [IndividualWhyInvest(keyFigureModel: keyfigure[0])],
    );
  }
}

class IndividualWhyInvest extends StatelessWidget {
  const IndividualWhyInvest({Key? key, required this.keyFigureModel})
      : super(key: key);
  final KeyFigureModel keyFigureModel;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(8.0),
      //   border: Border.all(color: Colors.black),
      // ),
      width: 150.0,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // CircleAvatar(
          //   radius: 50.0,
          //   backgroundImage: AssetImage(),
          // ),
          SizedBox(height: 8.0),
          Text(
            keyFigureModel.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.blue),
          ),
          SizedBox(height: 4.0),
          Text(
            keyFigureModel.position,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
