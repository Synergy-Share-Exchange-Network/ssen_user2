import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/utils/constants/colors.dart';

import '../../widget/Appbar Widget/appbar_button_2.dart';
import '../../widget/Appbar Widget/appbar_button_3.dart';
import 'search_screen.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    // return AppBarButton3(
    //   callback: () {
    //     showSearch(context: context, delegate: MySearchDelegate());
    //   },
    //   icon: Icons.search,
    // );
    return IconButton(
      onPressed: () =>
          showSearch(context: context, delegate: MySearchDelegate()),
      icon: Icon(Icons.search_rounded),
      color: SColors.black,
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResult = ["laptop", "car", "block", "cloth", "suit"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      AppBarButton3(
        callback: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
        icon: Icons.clear,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return AppBarButton2(
      callback: () => close(context, null),
      icon: Icons.arrow_back_ios,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // return Center(
    //   child: Text(
    //     query,
    //   ),
    // );
    return SearchScreen(
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResult.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
