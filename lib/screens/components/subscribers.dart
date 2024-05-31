import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Repository/firebase/key%20words/collection_name.dart';
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

    return Scaffold(
      drawer: NavBar(),
      appBar: (MediaQuery.of(context).size.width > phoneSize)
          ? PreferredSize(preferredSize: Size.zero, child: AppBar())
          : AppBar(
              actions: const [
                Icon(Iconsax.notification),
                SizedBox(width: 10),
                Icon(Iconsax.search_normal),
                SizedBox(width: 20),
              ],
              backgroundColor: dark ? SColors.lighGrey : SColors.homePageNavBar,
            ),
      body: Column(
        children: [
          _buildSubscriberList(),
          _buildFilterButtons(),
          Expanded(child: _buildSubscriptionList()),
        ],
      ),
    );
  }

  Widget _buildSubscriberList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .orderBy('createdDay', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        List<CompanyProfileModel> companies =
            snapshot.data!.docs.map((document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          return CompanyProfileModel.fromMap(data);
        }).toList();

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...companies.map((company) {
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
    );
  }

  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomChip(
          text: "All",
          icon: Iconsax.global,
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
          icon: Iconsax.people,
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
          icon: Iconsax.folder_open,
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
    );
  }

  Widget _buildSubscriptionList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection(CollectionName.organization)
          .orderBy('createdDay', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        List<CompanyProfileModel> companies =
            snapshot.data!.docs.map((document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          return CompanyProfileModel.fromMap(data);
        }).toList();

        // Apply filter based on selection
        List<CompanyProfileModel> filteredCompanies;
        if (isAllSelected) {
          filteredCompanies = companies;
        } else if (isPublicSelected) {
          // filteredCompanies = companies.where((company) => company.isPublic).toList();
          filteredCompanies = companies;
        } else if (isDonationSelected) {
          // filteredCompanies = companies.where((company) => company.isDonation).toList();
          filteredCompanies = companies;
        } else {
          filteredCompanies = companies;
        }

        return ListView.builder(
          itemCount: filteredCompanies.length,
          itemBuilder: (context, index) {
            return SubscriptionWidget(company: filteredCompanies[index]);
          },
        );
      },
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
                color: isSelected ? Colors.white : SColors.primary,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected ? Colors.white : SColors.primary,
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
              border: Border.all(color: SColors.primary, width: 2.0),
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
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: dark ? SColors.darkContainer : SColors.lightContainer,
        border: Border.all(
          width: 1,
          color: dark ? Colors.black : Colors.white,
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: company.logoImage[0] != ""
              ? NetworkImage(getImage(company.logoImage[0]))
              : const AssetImage(SImages.lightAppLogo) as ImageProvider,
        ),
        title: Text(company.name,
            style: dark
                ? STextTheme.darkTextTheme.headlineSmall
                : STextTheme.lightTextTheme.headlineSmall),
        subtitle: Text(company.motto ?? 'No description available'),
      ),
    );
  }
}
