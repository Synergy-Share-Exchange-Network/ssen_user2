import 'package:flutter/material.dart';

import '../../widget/Search Widget/searched_product_card.dart';
import '../../widget/Search Widget/searched_shop_card.dart';
import '../../widget/Search Widget/select_search_catagory_chip.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.query});
  static const route = "search_screen";
  final String query;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    bool isProduct = false;
    bool isAll = false;
    return Scaffold(
      // appBar: AppBar(
      //   leading: AppBarButton2(
      //     callback: () => Navigator.pop(context),
      //     icon: Icons.arrow_back_ios_new_outlined,
      //   ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  SelectSearchCatagoryChip(
                      title: "ALL",
                      isSelected: true,
                      icon: Icons.format_align_left_sharp),
                  SelectSearchCatagoryChip(
                      title: "Product",
                      isSelected: false,
                      icon: Icons.auto_awesome_mosaic_outlined),
                  SelectSearchCatagoryChip(
                    title: "Shop",
                    isSelected: false,
                    icon: Icons.store,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  var shopSortOption = [
                    'Popularity',
                    'Date',
                    'Rating',
                    'location'
                  ];
                  var productSortOption = [
                    'Popularity',
                    'price',
                    'Date',
                    'Rating',
                    'location'
                  ];
                  String shopSortOptionvalue = 'Popularity';
                  String productSortOptionvalue = 'Popularity';
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: (isAll == false && isProduct == true)
                            ? const Text('Sort Product')
                            : const Text('Sort Shop'),
                        content: Container(
                          height: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Based On'),
                              const SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                height: 50,
                                width: 150,
                                child: DropdownButton(
                                  value: (isAll == false && isProduct == true)
                                      ? productSortOptionvalue
                                      : shopSortOptionvalue,
                                  items: (isAll == false && isProduct == true)
                                      ? productSortOption.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList()
                                      : shopSortOption.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      shopSortOptionvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  SelectSearchCatagoryChipForLargeText(
                                      title: 'Decreasing',
                                      isSelected: false,
                                      icon: Icons.arrow_downward),
                                  SelectSearchCatagoryChipForLargeText(
                                      title: 'Increasing',
                                      isSelected: true,
                                      icon: Icons.arrow_upward),
                                ],
                              )
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(
                                  context); // This closes the dialog when the button is pressed.
                            },
                            child: Text('Save'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(
                                  context); // This closes the dialog when the button is pressed.
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const SelectSearchCatagoryChip(
                      title: "Sort", isSelected: true, icon: Icons.sort),
                ),
              ),
              const SearchProductCard(),
              const SearchShopCard(),
              const SearchProductCard(),
              const SearchShopCard(),
              const SearchProductCard(),
              const SearchShopCard(),
              const SearchProductCard(),
              const SearchShopCard(),
              const SearchProductCard(),
              const SearchShopCard(),
              const SearchProductCard(),
              const SearchShopCard(),
            ],
          ),
        ),
      ),
    );
  }
}
