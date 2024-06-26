import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Repository/firebase/key%20words/collection_name.dart';
import 'package:ssen_user/provider/user_provider.dart';
import 'package:ssen_user/utils/constants.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/constants/image_Strings.dart';
import 'package:ssen_user/utils/constants/navbar.dart';
import 'package:ssen_user/utils/helper_function.dart';
import 'package:ssen_user/utils/utils.dart';
import 'package:ssen_user/widget/subscription_widget.dart';

import '../../services/theme/text_theme.dart';

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
    bool dark = SHelperFunction.isDarkMode(context);
    UserModel user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      drawer: (MediaQuery.of(context).size.width > phoneSize) ? null : NavBar(),
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? PreferredSize(preferredSize: Size.zero, child: AppBar())
          : AppBar(
              actions: const [
                Icon(Iconsax.notification),
                SizedBox(width: 10),
                Icon(Iconsax.search_normal),
                SizedBox(width: 20),
              ],
              backgroundColor:
                  dark ? SColors.darkContainer : SColors.lightContainer,
            ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(CollectionName.organization)
                .orderBy('createdDay', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<CompanyProfileModel> companies =
                  snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return CompanyProfileModel.fromMap(data);
              }).toList();
              List<CompanyProfileModel> subcribed = [];
              for (var company in companies) {
                if (user.companiesId.contains(company.identification)) {
                  subcribed.add(company);
                }
                // if (user..contains(announcement.companyID)) {
                //   subcribed.add(announcement);
                // }

              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...subcribed.map((company) {
                      return MiniCompanySub(company: company);
                    }).toList(),
                    TextButton(
                      onPressed: () {
                        // Add your onPressed code here
                      },
                      child: const Text("View all"),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomChip(
                text: "All",
                icon: Icons.all_inbox,
                isSelected: isAllSelected,
                onSelected: () {
                  setState(() {
                    isAllSelected = true;
                    isPublicSelected = false;
                    isDonationSelected = false;
                  });
                },
              ),
              CustomChip(
                text: "Public",
                icon: Icons.people,
                isSelected: isPublicSelected,
                onSelected: () {
                  setState(() {
                    isAllSelected = false;
                    isPublicSelected = true;
                    isDonationSelected = false;
                  });
                },
              ),
              CustomChip(
                text: "Donation",
                icon: Icons.folder_open,
                isSelected: isDonationSelected,
                onSelected: () {
                  setState(() {
                    isAllSelected = false;
                    isPublicSelected = false;
                    isDonationSelected = true;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection(CollectionName.organization)
                .orderBy('createdDay', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              List<CompanyProfileModel> companies =
                  snapshot.data!.docs.map((document) {
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                return CompanyProfileModel.fromMap(data);
              }).toList();
              List<CompanyProfileModel> subcribed = [];
              List<CompanyProfileModel> public = [];
              List<CompanyProfileModel> donation = [];
              for (var company in companies) {
                if (user.companiesId.contains(company.identification)) {
                  subcribed.add(company);
                }
              }
              for (var company in subcribed) {
                if (company.isPublic) {
                  public.add(company);
                } else {
                  donation.add(company);
                }
              }
              // Apply filter based on selection
              List<CompanyProfileModel> filteredCompanies;
              if (isAllSelected) {
                filteredCompanies = subcribed;
              } else if (isPublicSelected) {
                // filteredCompanies = companies.where((company) => company.isPublic).toList();
                filteredCompanies = public;
              } else if (isDonationSelected) {
                // filteredCompanies = companies.where((company) => company.isDonation).toList();
                filteredCompanies = donation;
              } else {
                filteredCompanies = subcribed;
              }

              return ListView.builder(
                itemCount: filteredCompanies.length,
                itemBuilder: (context, index) {
                  return SubscriptionWidget(company: filteredCompanies[index]);
                },
              );
            },
          )),
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onSelected;

  const CustomChip({
    Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        width: 110,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ElevatedButton(
          onPressed: onSelected,
          style: ElevatedButton.styleFrom(
            primary: isSelected ? SColors.primary : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: SColors.primary),
            ),
            padding: const EdgeInsets.all(16.0),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.lightBlueAccent,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                  ),
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
  final CompanyProfileModel company;

  const MiniCompanySub({
    Key? key,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      width: 60,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // border: Border.all(color: SColors.primary, width: 2.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: company.logoImage[0] != ""
                    ? NetworkImage(getImage(company.logoImage[0]))
                    : const AssetImage(SImages.lightAppLogo) as ImageProvider,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            company.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class SubscriptionWidget extends StatelessWidget {
  final CompanyProfileModel company;

  const SubscriptionWidget({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool dark = SHelperFunction.isDarkMode(context);
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: dark
              ? [Colors.black54, Colors.black87]
              : [Colors.white, Colors.grey[200]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: dark ? Colors.black45 : Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80.0, // Set the width of the image
            height: 80.0, // Set the height of the image
            child: CircleAvatar(
              radius: 40,
              backgroundImage: company.logoImage[0] != ""
                  ? NetworkImage(getImage(company.logoImage[0]))
                  : const AssetImage(SImages.lightAppLogo) as ImageProvider,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  company.name,
                  style: dark
                      ? STextTheme.darkTextTheme.headlineSmall
                      : STextTheme.lightTextTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  company.motto ?? 'No description available',
                  style: TextStyle(
                    color: dark ? Colors.grey[400] : Colors.grey[800],
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: dark ? Colors.white : Colors.black54,
            ),
            onPressed: () {
              // Add your favorite button action here
            },
          ),
        ],
      ),
    );
  }
}
