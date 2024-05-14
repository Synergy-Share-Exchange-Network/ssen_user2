import 'package:flutter/material.dart';

class SearchShopCard extends StatelessWidget {
  const SearchShopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 92,
      width: MediaQuery.of(context).size.width - 10,
      decoration: BoxDecoration(
          color: Color.fromARGB(7, 33, 149, 243),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: const Color.fromARGB(5, 255, 153, 0),
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/cash_on_delivery.jpg')),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 170,
                child: const Text(
                  "Shop Name Shop name Shop Name Shop nameShop Name Shop nameShop Name Shop nameShop Name Shop name",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 170,
                child: const Text(
                  "Shop little Description Shop little Description Shop little Description Shop little DescriptionShop little Description Shop little DescriptionShop little Description Shop little DescriptionShop little Description Shop little Description",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
