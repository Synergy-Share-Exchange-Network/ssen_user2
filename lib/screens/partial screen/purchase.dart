import 'dart:typed_data';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:signature/signature.dart';
import 'package:ssen_user/Models/purchase_model.dart';

import 'package:ssen_user/utils/constants/text_string.dart';
import '../../utils/constants.dart';
import '../../utils/constants/size.dart';
import '../../widget/form_step.dart';
import '../../widget/formelement.dart';

class Purchase extends StatefulWidget {
  const Purchase({
    Key? key,
  }) : super(key: key);

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  int formIndex = 0;
  final List<String> items = [
    'CBE',
    'BOA',
    'NIB',
    'OBA',
  ];
  Uint8List? exportedImage;

  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.red,
    exportBackgroundColor: Colors.yellow,
  );
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    PurchaseModel purchase = PurchaseModel(
      identification: "13",
      firstName: "david ",
      lastName: "nigus",
      email: "dawitnigus@gmail.com",
      nationality: "ethiopian",
      region: "oromia",
      subCity: "bishoftu",
      phoneNumber: "0967547632",
      sharePerPrice: 500,
      numberOfShare: 40,
      bankAccount: "1000006474537",
      savingAccountAmount: "566",
      signature: "13",
      shareID: "14",
      userID: "55",
      companyID: "66",
    );
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Iconsax.backward),
      ),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: formIndex,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const FormStep(
                                index: 1,
                              ),
                              const SizedBox(
                                height: SSizes.spaceBtwItems,
                              ),
                              Text(
                                "Personal Information",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(SSizes.defaultSpace),
                        child: Column(
                          children: [
                            // for two textfield
                            Row(
                              children: [
                                Column(
                                  children: [
                                    const FormElement(
                                      title: "First Name",
                                      important: true,
                                    ),
                                    const SizedBox(
                                      height: SSizes.spaceBtwItems / 2,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Iconsax.user),
                                          labelText: purchase.firstName),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: SSizes.spaceBtwItems,
                                ),
                                Column(
                                  children: [
                                    const FormElement(
                                      title: "Last Name",
                                      important: true,
                                    ),
                                    const SizedBox(
                                      height: SSizes.spaceBtwItems / 2,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Iconsax.user),
                                          labelText: purchase.lastName),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            // for one text field
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const FormElement(
                                        title: "Nationality",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Iconsax.location_minus),
                                            labelText: purchase.nationality),
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
                                        title: "Region",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Iconsax.location),
                                            labelText: purchase.region),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const FormElement(
                                        title: "City/SubCity",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Iconsax.location_add5),
                                            labelText: purchase.subCity),
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
                                        title: "Woreda",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            prefixIcon:
                                                Icon(Iconsax.location_tick),
                                            labelText: purchase.email),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            // for one
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: "phone number",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Iconsax.call),
                                      labelText: purchase.phoneNumber),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            //end
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: "Email",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Iconsax.message),
                                      labelText: purchase.email),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            //end
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                // nextpage
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const FormStep(
                                index: 2,
                              ),
                              SizedBox(
                                height: SSizes.spaceBtwItems,
                              ),
                              Text(
                                "Purchese Information",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: SSizes.spaceBtwSections / 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(SSizes.defaultSpace),
                        child: Column(
                          children: [
                            // for two textfield
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const FormElement(
                                        title: "Price Per share",
                                        important: true,
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Iconsax.money),
                                            labelText:
                                                '${purchase.sharePerPrice}'),
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
                                        title: "Number of Share",
                                        important: true,
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Iconsax.user),
                                            labelText:
                                                '${purchase.numberOfShare}'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            // for one text field
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const FormElement(
                                        title: "Percentage",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      TextFormField(
                                        decoration: const InputDecoration(
                                            prefixIcon:
                                                Icon(Iconsax.location_minus),
                                            labelText: SText.percentage),
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
                                        title: "Bank Name",
                                      ),
                                      const SizedBox(
                                        height: SSizes.spaceBtwItems / 2,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<String>(
                                          isExpanded: true,
                                          hint: Text(
                                            'Select Bank',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: items
                                              .map((String item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: selectedValue,
                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedValue = value;
                                            });
                                          },
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            height: 40,
                                            width: 140,
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            height: 40,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),

                            // for one
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: "Checking Account",
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Iconsax.bank),
                                      labelText: purchase.bankAccount),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            //end
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FormElement(
                                  title: SText.savingAccount,
                                ),
                                const SizedBox(
                                  height: SSizes.spaceBtwItems / 2,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      prefixIcon: Icon(Iconsax.bank4),
                                      labelText: SText.savingAccount),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: SSizes.spaceBtwInputField,
                            ),
                            //end
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const FormStep(
                                index: 2,
                              ),
                              SizedBox(
                                height: SSizes.spaceBtwItems,
                              ),
                              Text(
                                "Purchese Information",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Signature(
                              controller: controller,
                              height: 250,
                              width: MediaQuery.of(context).size.width / 1.05,
                              backgroundColor: Colors.grey[300]!,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        exportedImage =
                                            await controller.toPngBytes();

                                        setState(() {});
                                      },
                                      child: const Text(
                                        "Save Signature",
                                      ),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.clear();
                                      },
                                      child: const Text(
                                        "Clear Signature",
                                      ),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (exportedImage != null)
                              Image.memory(
                                exportedImage!,
                                width: 300,
                                height: 250,
                              ),
                            if (exportedImage != null)
                              ElevatedButton(
                                onPressed: () {
                                  exportedImage = null;
                                  setState(() {});
                                },
                                child: const Text("Clear Export"),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: (MediaQuery.of(context).size.width > phoneSize)
                ? const EdgeInsets.all(8)
                : const EdgeInsets.fromLTRB(0, 20, 10, 5),
            height: 30,
            child: Row(
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                formIndex > 0
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            formIndex--;
                          });
                        },
                        child: Text(" Privious "))
                    : const SizedBox(
                        width: 60,
                      ),
                const Expanded(flex: 10, child: SizedBox()),
                formIndex != 4
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            formIndex++;
                          });
                        },
                        child: const Text("   Next   "))
                    : ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(primary: Colors.orange),
                        child: const Text("   Finish   ")),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
