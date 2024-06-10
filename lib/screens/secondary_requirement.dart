import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants/size.dart';
import '../widget/formelement.dart';

class SecondarySellRequirement extends StatelessWidget {
  const SecondarySellRequirement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const FormElement(
                  title: "Minmum Number share to sell",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  // controller: minim,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.location_tick),
                      labelText: 'Minmum Number share to sell'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const FormElement(
                  title: "Max Number share to sell",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  // controller: minim,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.location_tick),
                      labelText: 'Max Number share to sell'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const FormElement(
                  title: "Minmum Price per  Share",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  // controller: minim,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.location_tick),
                      labelText: 'min'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const FormElement(
                  title: "Max Price per share",
                ),
                const SizedBox(
                  height: SSizes.spaceBtwItems / 2,
                ),
                TextFormField(
                  // controller: minim,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.location_tick),
                      labelText: 'Woreda'),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
