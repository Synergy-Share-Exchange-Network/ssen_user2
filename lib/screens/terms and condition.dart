import 'package:flutter/material.dart';
import 'package:ssen_user/Models/term_condition.dart';
import 'package:ssen_user/utils/constants/text_string.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({super.key, required this.termAndCondition});
  static const route = "term_and_condition";
  final List<TermConditionModel> termAndCondition;

  @override
  Widget build(BuildContext context) {
    // TermConditionModel termandcondition = TermConditionModel(
    //   identification: "88",
    //   title: "introduction",
    //   description:
    //       "Lorem  ythf ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquam lobortis purus non pulvinar. ",
    //   companyId: "",
    // );
    // TermConditionModel termandcondition2 = TermConditionModel(
    //   identification: "",
    //   title: "acceptance",
    //   description:
    //       "By using this app or website, you agree to abide by the following Terms and Conditions.",
    //   companyId: "",
    // );
    // TermConditionModel termandcondition3 = TermConditionModel(
    //   identification: "",
    //   title: "age restriction",
    //   description:
    //       'You must be at least 18 years old to use this app or website.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition4 = TermConditionModel(
    //   identification: "",
    //   title: "account creation",
    //   description:
    //       'You are responsible for maintaining the confidentiality of your account credentials.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition5 = TermConditionModel(
    //   identification: "",
    //   title: "prohibited activities",
    //   description:
    //       'You are not allowed to engage in any form of harassment, spamming, or illegal content sharing.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition6 = TermConditionModel(
    //   identification: "",
    //   title: "content ownership",
    //   description:
    //       'You retain ownership of the content you post, but grant the app or website necessary licenses to display or use that content.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition7 = TermConditionModel(
    //   identification: "",
    //   title: "copyright ownership",
    //   description:
    //       'All content provided by this app or website is protected by copyright laws.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition8 = TermConditionModel(
    //   identification: "",
    //   title: "trademarks",
    //   description:
    //       'The app or website trademarks are the property of their respective owners. Unauthorized use is prohibited.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition9 = TermConditionModel(
    //   identification: "",
    //   title: "limitation of liability",
    //   description:
    //       'We are not responsible for any damages or losses incurred by users while using this app or website.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition10 = TermConditionModel(
    //   identification: "",
    //   title: "privacy policy",
    //   description:
    //       'This app or website has a separate Privacy Policy that you should review for details on data collection, usage, and protection.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition11 = TermConditionModel(
    //   identification: "",
    //   title: "modifications to terms and conditions",
    //   description:
    //       'We reserve the right to modify or update the terms and conditions.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition12 = TermConditionModel(
    //   identification: "",
    //   title: "termination",
    //   description:
    //       'we can terminate your accesss to this app or website if you violate the terms and conditions.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition13 = TermConditionModel(
    //   identification: "",
    //   title: "governing law",
    //   description:
    //       'the term and conditions shall be governed by and constructed.',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition14 = TermConditionModel(
    //   identification: "",
    //   title: "contact information",
    //   description:
    //       'for any inquiries or concerns please contact as at example@gmail.com ',
    //   companyId: "",
    // );
    // TermConditionModel termandcondition15 = TermConditionModel(
    //   identification: "",
    //   title: "effective  date",
    //   description:
    //       'these term and conditions are effective as of september1,2023',
    //   companyId: "",
    // );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined,
                size: 20, color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Term And Condition',
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.blue,
            // fontSize: 27,
            // fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                IndividualTermAndCondition(
                    termandcondition: termAndCondition[0]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IndividualTermAndCondition extends StatelessWidget {
  const IndividualTermAndCondition({
    Key? key,
    required this.termandcondition,
  }) : super(key: key);

  final TermConditionModel termandcondition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          termandcondition.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 16),
        Text(
          termandcondition.description,
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
