import 'package:flutter/material.dart';
import 'package:ssen_user/utils/constants/colors.dart';

import '../../services/theme/text_theme.dart';
import '../../utils/constants/image_Strings.dart';
import '../../utils/constants/size.dart';
import '../../utils/helper_function.dart';

class HorizontalScrollablePartners extends StatefulWidget {
  @override
  _HorizontalScrollablePartnersState createState() =>
      _HorizontalScrollablePartnersState();
}

class _HorizontalScrollablePartnersState
    extends State<HorizontalScrollablePartners> {
  final List<ScrollableItem> items = [
    ScrollableItem(
      image: SImages.partner1,
    ),
    ScrollableItem(
      image: SImages.partner2,
    ),
    ScrollableItem(
      image: SImages.partner4,
    ),
    ScrollableItem(
      image: SImages.partner3,
    ),
    // Add more items as needed
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Partners",
              style: dark
                  ? STextTheme.darkTextTheme.headlineSmall
                  : STextTheme.lightTextTheme.headlineSmall,
            ),
          ),
          const SizedBox(
            height: SSizes.iconXS,
          ),
          Container(
            height: 150.0,
            width: double.maxFinite,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ScrollableListItem(item: items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollableItem {
  final String image;

  ScrollableItem({
    required this.image,
  });
}

class ScrollableListItem extends StatelessWidget {
  final ScrollableItem item;

  ScrollableListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ScrollableItemWidget(item: item);
  }
}

class ScrollableItemWidget extends StatelessWidget {
  final ScrollableItem item;

  ScrollableItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    return Row(
      children: [
        Container(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40.0,
            backgroundImage: AssetImage(item.image),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
