import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants/size.dart';
import '../utils/constants/text_string.dart';
import '../widget/formelement.dart';

class PostShareSecondary extends StatelessWidget {
  const PostShareSecondary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Share'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const FormElement(
                        title: "No of Share",
                        important: true,
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: SText.noOfShare),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: SSizes.spaceBtwItems,
                ),
                Expanded(
                  child: Column(
                    children: [
                      const FormElement(
                        title: "Per Share Price",
                        important: true,
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwItems / 2,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.money_recive),
                            labelText: SText.perSharePrice),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: SSizes.spaceBtwInputField,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormElement(
                  title: "Contact",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.call),
                      labelText: SText.phoneNumber),
                ),
              ],
            ),
            const SizedBox(
              height: SSizes.spaceBtwInputField,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormElement(
                  title: "Company Name",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.home_trend_up),
                      labelText: SText.companyName),
                ),
              ],
            ),
            const SizedBox(
              height: SSizes.spaceBtwInputField,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormElement(
                  title: "Company Name",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.home_trend_up),
                      labelText: SText.companyName),
                ),
              ],
            ),
            const SizedBox(
              height: SSizes.spaceBtwInputField,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormElement(
                  title: "Company Name",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.home_trend_up),
                      labelText: SText.companyName),
                ),
              ],
            ),
            const SizedBox(
              height: SSizes.spaceBtwInputField,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormElement(
                  title: "Company Name",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.home_trend_up),
                      labelText: SText.companyName),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
