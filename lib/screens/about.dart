import 'package:flutter/material.dart';
import 'package:ssen_user/utils/constants/text_string.dart';

class About extends StatelessWidget {
  const About({super.key});
  static const route = "AboutUs";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.blue,
              size: 20,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'About Us',
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SText.ourCompany,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquam lobortis purus non pulvinar.',
                ),
                SizedBox(height: 24),
                Text(
                  SText.ourMission,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquam lobortis purus non pulvinar.',
                ),
                SizedBox(height: 24),
                Text(
                  SText.ourTeam,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquam lobortis purus non pulvinar.',
                ),
                SizedBox(height: 24),
                Text(
                  SText.contactUs,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'For any inquiries or questions, please contact us at example@example.com.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
