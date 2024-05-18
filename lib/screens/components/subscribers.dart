import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/constants/image_Strings.dart';
import 'package:ssen_user/utils/constants/navbar.dart';
import 'package:ssen_user/utils/helper_function.dart';
import 'package:ssen_user/utils/utils.dart';
import 'package:ssen_user/widget/subscription_widget.dart';

class Subscribers extends StatefulWidget {
  const Subscribers({super.key});

  @override
  State<Subscribers> createState() => _SubscribersState();
}

class _SubscribersState extends State<Subscribers> {
  bool isAllSelected = true;
  bool isPublicSelected = false;
  bool isDonationSelected = false;
  @override
  Widget build(BuildContext context) {
    bool isDark = SHelperFunction.isDarkMode(context);
    setState(() {});

    return Scaffold(
      drawer: NavBar(),
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? PreferredSize(preferredSize: Size.zero, child: AppBar())
          : AppBar(
              actions: const [
                Icon(Iconsax.notification),
                SizedBox(
                  width: 10,
                ),
                Icon(Iconsax.search_normal),
                SizedBox(
                  width: 20,
                )
              ],
              backgroundColor:
                  (!isDark) ? SColors.lighGrey : SColors.homePageNavBar,

              // elevation: 1,
            ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  // MiniCompanySub(),
                  TextButton(onPressed: () {}, child: const Text("View all"))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                // width: MediaQuery.of(context).size.width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: CustomChip(
                        icon: Iconsax.align_horizontally,
                        text: 'All',
                        isSelected: isAllSelected,
                      ),
                      onTap: () {
                        setState(() {
                          isAllSelected = true;
                          isPublicSelected = false;
                          isDonationSelected = false;
                        });
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: CustomChip(
                        icon: Iconsax.people,
                        text: 'Public',
                        isSelected: isPublicSelected,
                      ),
                      onTap: () {
                        print("hello");
                        isAllSelected = false;
                        isPublicSelected = true;
                        isDonationSelected = false;
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      child: CustomChip(
                        icon: Iconsax.document1,
                        text: 'Dontaion',
                        isSelected: isDonationSelected,
                      ),
                      onTap: () {
                        setState(() {
                          isAllSelected = false;
                          isPublicSelected = false;
                          isDonationSelected = true;
                        });
                      },
                    ),

                    // CustomChip(title: "All"),
                    // CustomChip(title: "T-shert"),
                    // CustomChip(title: "Pants"),
                    // CustomChip(title: "Human Hair"),
                    // CustomChip(title: "Foods"),
                    // CustomChip(title: "Book"),
                    // CustomChip(title: "More"),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  // InkWell(
                  //     onTap: () {
                  //       print("hello");
                  //       print(isDonationSelected);
                  //       isAllSelected = false;
                  //       isPublicSelected = false;
                  //       isDonationSelected = true;
                  //       print(isDonationSelected);

                  //       setState(() {});
                  //       print(isDonationSelected);
                  //     },
                  //     child: SubscriptionWidget()),
                  // InkWell(
                  //     onTap: () {
                  //       print(isDonationSelected);
                  //     },
                  //     child: SubscriptionWidget()),
                  // SubscriptionWidget(),
                  // SubscriptionWidget(),
                  // SubscriptionWidget(),
                  // SubscriptionWidget(),
                  // SubscriptionWidget(),
                  // SubscriptionWidget(),
                  // SubscriptionWidget(),
                ],
              ),
            )
            // Column(
            //   children: [
            //     // Product(
            //     //   product: car,
            //     //   shopOwner: seller,
            //     // ),
            //     // Product(
            //     //   product: car,
            //     //   shopOwner: seller,
            //     // ),
            //     // Product(
            //     //   product: car,
            //     //   shopOwner: seller,
            //     // ),
            //     // Product(
            //     //   product: car,
            //     //   shopOwner: seller,
            //     // ),
            //     // Product(
            //     //   product: car,
            //     //   shopOwner: seller,
            //     // ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class CustomChip extends StatefulWidget {
  const CustomChip({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final bool isSelected;

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  late bool _isSelect;
  void initState() {
    super.initState();
    _isSelect = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelect = true; // Change color to blue
          // Navigate to another page
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SecondPage()), // Replace SecondPage with your desired page
          // );
        });
      },
      child: Container(
        width: 110,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: (_isSelect) ? SColors.primary : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                    color: SColors.primaryColor) // Adjust the value as needed
                ),
            padding: EdgeInsets.all(
                16.0), // Adjust the padding to increase the height and width
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: (_isSelect) ? Colors.white : SColors.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 48,
                child: Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: (_isSelect) ? Colors.white : SColors.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniCompanySub extends StatelessWidget {
  const MiniCompanySub({
    Key? key,
    required this.company,
  }) : super(key: key);
  final CompanyProfileModel company;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      width: 60,
      // height: 80,
      child: Column(children: [
        (company.logoImage[0] != "")
            ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: SColors.primary, width: 2.0),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(getImage(company.logoImage[0])))),
              )
            : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: SColors.primary, width: 2.0),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(SImages.lightAppLogo))),
              ),
        // const Expanded(flex: 1, child: SizedBox()),
        const SizedBox(
          width: 10,
        ),

        Text(
          company.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ]),
    );
  }
}
