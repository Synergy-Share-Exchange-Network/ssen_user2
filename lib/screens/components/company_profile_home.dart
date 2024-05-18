import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/services/theme/text_theme.dart';
import 'package:ssen_user/utils/constants/colors.dart';
import 'package:ssen_user/utils/constants/image_Strings.dart';

import '../../utils/helper_function.dart';
import '../../widget/company detail/counter_tiltle_widget.dart';
import '../../widget/company detail/description_widget.dart';
import '../../widget/company detail/employees_widget.dart';
import '../../widget/company detail/partners_widget.dart';
import '../../widget/company detail/testimonial_widget.dart';
import '../../widget/company detail/why_do_you_invest_widget.dart';

class CompanyHome extends StatefulWidget {
  const CompanyHome({super.key, required this.company});
  final CompanyProfileModel company;

  @override
  State<CompanyHome> createState() => _CompanyHomeState();
}

class _CompanyHomeState extends State<CompanyHome> {
  final double coverHeight = 150;
  final double profileHeight = 170;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunction.isDarkMode(context);
    final double top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(
            margin: EdgeInsets.only(bottom: bottom),
            color: Colors.blue,
            child: Image.asset(
              SImages.NIB1,
              width: double.infinity,
              height: coverHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: top,
            child: Container(
              padding: EdgeInsets.all(
                  5.0), // Adjust the padding to control the border size
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dark ? Colors.black : Colors.white,
              ),
              child: CircleAvatar(
                radius: profileHeight / 2,
                backgroundColor: SColors.lightContainer,
                backgroundImage: AssetImage(SImages.NIB2),
              ),
            ),
          ),
        ]),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              widget.company.name,
              style: dark
                  ? STextTheme.darkTextTheme.headlineMedium
                  : STextTheme.lightTextTheme.headlineLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.company.motto,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.blue, // Set the desired text color
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        HorizontalScrollableCounter(),
        const SizedBox(
          height: 10,
        ),
        ExpandableAboutUsText(text: widget.company.description),
        HorizontalScrollableWhyInvest(
          whyinvests: [],
        ),
        HorizontalScrollableKeyFigure(
          keyfigure: [],
        ),
        HorizontalScrollableTestimonial(),
        SizedBox(
          height: 20,
        ),
        HorizontalScrollablePartners()
      ]),
    ));
  }
}
