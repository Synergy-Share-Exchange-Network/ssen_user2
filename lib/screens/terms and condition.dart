import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
import '../utils/helper_function.dart';

class TermsAndConditionsPage extends StatefulWidget {
  static const route = "TermsAndConditionsPage";
  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final dark = SHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Term and Condition',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        backgroundColor: dark ? SColors.darkContainer : SColors.lightContainer,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          constraints:
              BoxConstraints(maxWidth: width > 800 ? 800 : width * 0.9),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '1. Introduction',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Welcome to [Your Company Name]! These terms and conditions outline the rules and regulations for the use of [Your Company Name]\'s Website and services, located at [your website address].\n\n'
                    'By accessing this website we assume you accept these terms and conditions. Do not continue to use [Your Company Name] if you do not agree to take all of the terms and conditions stated on this page.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '2. Cookies',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'We employ the use of cookies. By accessing [Your Company Name], you agreed to use cookies in agreement with the [Your Company Name]\'s Privacy Policy.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '3. License',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Unless otherwise stated, [Your Company Name] and/or its licensors own the intellectual property rights for all material on [Your Company Name]. All intellectual property rights are reserved. You may access this from [Your Company Name] for your own personal use subjected to restrictions set in these terms and conditions.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '4. User Comments',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. [Your Company Name] does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of [Your Company Name], its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '5. Content Liability',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '[Your Company Name] shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '6. Reservation of Rights',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '7. Removal of links from our website',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '8. Disclaimer',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:\n\n'
                    '* limit or exclude our or your liability for death or personal injury;\n'
                    '* limit or exclude our or your liability for fraud or fraudulent misrepresentation;\n'
                    '* limit any of our or your liabilities in any way that is not permitted under applicable law; or\n'
                    '* exclude any of our or your liabilities that may not be excluded under applicable law.\n\n'
                    'The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.\n\n'
                    'As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:ssen_user/Models/term_condition.dart';
// import 'package:ssen_user/utils/constants/text_string.dart';

// class TermAndCondition extends StatelessWidget {
//   const TermAndCondition({super.key, required this.termAndCondition});
//   static const route = "term_and_condition";
//   final List<TermConditionModel> termAndCondition;

//   @override
//   Widget build(BuildContext context) {
//     // TermConditionModel termandcondition = TermConditionModel(
//     //   identification: "88",
//     //   title: "introduction",
//     //   description:
//     //       "Lorem  ythf ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquam lobortis purus non pulvinar. ",
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition2 = TermConditionModel(
//     //   identification: "",
//     //   title: "acceptance",
//     //   description:
//     //       "By using this app or website, you agree to abide by the following Terms and Conditions.",
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition3 = TermConditionModel(
//     //   identification: "",
//     //   title: "age restriction",
//     //   description:
//     //       'You must be at least 18 years old to use this app or website.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition4 = TermConditionModel(
//     //   identification: "",
//     //   title: "account creation",
//     //   description:
//     //       'You are responsible for maintaining the confidentiality of your account credentials.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition5 = TermConditionModel(
//     //   identification: "",
//     //   title: "prohibited activities",
//     //   description:
//     //       'You are not allowed to engage in any form of harassment, spamming, or illegal content sharing.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition6 = TermConditionModel(
//     //   identification: "",
//     //   title: "content ownership",
//     //   description:
//     //       'You retain ownership of the content you post, but grant the app or website necessary licenses to display or use that content.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition7 = TermConditionModel(
//     //   identification: "",
//     //   title: "copyright ownership",
//     //   description:
//     //       'All content provided by this app or website is protected by copyright laws.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition8 = TermConditionModel(
//     //   identification: "",
//     //   title: "trademarks",
//     //   description:
//     //       'The app or website trademarks are the property of their respective owners. Unauthorized use is prohibited.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition9 = TermConditionModel(
//     //   identification: "",
//     //   title: "limitation of liability",
//     //   description:
//     //       'We are not responsible for any damages or losses incurred by users while using this app or website.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition10 = TermConditionModel(
//     //   identification: "",
//     //   title: "privacy policy",
//     //   description:
//     //       'This app or website has a separate Privacy Policy that you should review for details on data collection, usage, and protection.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition11 = TermConditionModel(
//     //   identification: "",
//     //   title: "modifications to terms and conditions",
//     //   description:
//     //       'We reserve the right to modify or update the terms and conditions.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition12 = TermConditionModel(
//     //   identification: "",
//     //   title: "termination",
//     //   description:
//     //       'we can terminate your accesss to this app or website if you violate the terms and conditions.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition13 = TermConditionModel(
//     //   identification: "",
//     //   title: "governing law",
//     //   description:
//     //       'the term and conditions shall be governed by and constructed.',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition14 = TermConditionModel(
//     //   identification: "",
//     //   title: "contact information",
//     //   description:
//     //       'for any inquiries or concerns please contact as at example@gmail.com ',
//     //   companyId: "",
//     // );
//     // TermConditionModel termandcondition15 = TermConditionModel(
//     //   identification: "",
//     //   title: "effective  date",
//     //   description:
//     //       'these term and conditions are effective as of september1,2023',
//     //   companyId: "",
//     // );
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back_ios_new_outlined,
//                 size: 20, color: Colors.blue)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Term And Condition',
//           style: TextStyle(
//             decoration: TextDecoration.none,
//             color: Colors.blue,
//             // fontSize: 27,
//             // fontWeight: FontWeight.bold
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: const BoxDecoration(),
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 IndividualTermAndCondition(
//                     termandcondition: termAndCondition[0]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IndividualTermAndCondition extends StatelessWidget {
//   const IndividualTermAndCondition({
//     Key? key,
//     required this.termandcondition,
//   }) : super(key: key);

//   final TermConditionModel termandcondition;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           termandcondition.title,
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//         SizedBox(height: 16),
//         Text(
//           termandcondition.description,
//         ),
//         SizedBox(height: 24),
//       ],
//     );
//   }
// }
