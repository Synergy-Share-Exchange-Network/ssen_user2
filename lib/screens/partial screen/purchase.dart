import 'dart:typed_data';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/purchase_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Repository/firebase/service%20methods/firebase_purchase_service_method.dart';

import 'package:ssen_user/utils/constants/text_string.dart';
import 'package:ssen_user/utils/utils.dart';
import '../../provider/user_provider.dart';
import '../../utils/constants.dart';
import '../../utils/constants/size.dart';
import '../../widget/form_step.dart';
import '../../widget/formelement.dart';

class Purchase extends StatefulWidget {
  const Purchase({
    Key? key,
    required this.share,
    required this.user,
  }) : super(key: key);
  final ShareModel share;
  final UserModel user;

  @override
  State<Purchase> createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  //controller
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController kebeleController = TextEditingController();
  TextEditingController subCityController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController woredaController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController numberOfShareController = TextEditingController();
  TextEditingController sharePerPriceController = TextEditingController();
  TextEditingController payedamountController = TextEditingController();
  @override
  void initState() {
    firstNameController.text = widget.user.firstName;
    lastNameController.text = widget.user.lastName;
    emailController.text = widget.user.email;
    kebeleController.text = widget.user.kebele;
    subCityController.text = widget.user.subCity;
    houseNumberController.text = widget.user.houseNumber;
    phoneNumberController.text = widget.user.phoneNumber;
    regionController.text = widget.user.region;
    woredaController.text = widget.user.woreda;
    nationalityController.text = widget.user.nationality;
    super.initState();
  }

  Uint8List? _kebleIdFront;
  Uint8List? _kebleIdBack;
  Uint8List? exportedImage;

  void _selectkebleIdFrontImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _kebleIdFront = im;
    });
  }

  void _deleteKebleIdFrontImage() async {
    _kebleIdFront = null;

    setState(() {});
  }

  void _selectKebleIdBackImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _kebleIdBack = im;
    });
  }

  void _deleteKebleIdBackImage() async {
    _kebleIdBack = null;

    setState(() {});
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    kebeleController.dispose();
    subCityController.dispose();
    houseNumberController.dispose();
    phoneNumberController.dispose();
    regionController.dispose();
    woredaController.dispose();
    nationalityController.dispose();
    numberOfShareController.dispose();
    sharePerPriceController.dispose();
    payedamountController.dispose();
    super.dispose();
  }

  int formIndex = 0;
  final List<String> items = [
    'CBE',
    'BOA',
    'NIB',
    'OBA',
  ];

  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  String? selectedValue;
  Future<void> createPurchase(ShareModel share, UserModel user) async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Container(
          padding: EdgeInsets.all(20),
          height: 125,
          child: Column(
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text("Purchasing Share..."),
            ],
          ),
        ),
      ),
    );
    PurchaseModel purchase = PurchaseModel(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      kebele: kebeleController.text.trim(),
      subCity: subCityController.text.trim(),
      houseNumber: houseNumberController.text.trim(),
      phoneNumber: phoneNumberController.text.trim(),
      region: regionController.text.trim(),
      woreda: woredaController.text.trim(),
      nationality: nationalityController.text.trim(),
      numberOfShare:
          double.tryParse(numberOfShareController.text.trim()) ?? 0.0,
      sharePerPrice:
          double.tryParse(sharePerPriceController.text.trim()) ?? 0.0,
      payedamount: double.tryParse(payedamountController.text.trim()) ?? 0.0,
    );
    // print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    // print(purchase);
    // print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    // print(company);
    // String sharePurchsed = "false";
    String sharePurchsed = await FirebasePurchaseServiceMethod().createPurchase(
        purchase, share, user, exportedImage, _kebleIdFront, _kebleIdBack);
    // String branchCreated = await FirebaseBranchRepositry().createBranch(
    //     branch: branch,
    //     humanResourceEmployee: humanResourceEmployee,
    //     humanResourceEmployeepassword: passwordController.text,
    //     mainImage: mainImage,
    //     humanResourceImage: humanResourceImage);
    print(sharePurchsed);
    Navigator.pop(context);

    if (sharePurchsed == "Success") {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Container(
            padding: EdgeInsets.all(20),
            height: 100,
            child: Column(
              children: [
                const Text("Succesfully Request Sent."),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // await FlutterSecureStorageEmailAndPasswordMethod()
                      //     .signInUsingLocalData();
                      // Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      // Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text("   Okay   "))
              ],
            ),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Container(
            padding: EdgeInsets.all(20),
            height: 125,
            child: Column(
              children: [
                Text("Error: $sharePurchsed",
                    style: TextStyle(color: Colors.red)),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      // await FlutterSecureStorageEmailAndPasswordMethod()
                      //     .signInUsingLocalData();
                      // Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: const Text("   Okay   "))
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // PurchaseModel purchase = PurchaseModel(
    //   identification: "13",
    //   firstName: "david ",
    //   lastName: "nigus",
    //   email: "dawitnigus@gmail.com",
    //   nationality: "ethiopian",
    //   region: "oromia",
    //   subCity: "bishoftu",
    //   phoneNumber: "0967547632",
    //   sharePerPrice: 500,
    //   numberOfShare: 40,
    //   bankAccount: "1000006474537",
    //   savingAccountAmount: "566",
    //   signature: "13",
    //   shareID: "14",
    //   userID: "55",
    //   companyID: "66",
    // );
    UserModel user = Provider.of<UserProvider>(context).getUser;

    sharePerPriceController.text = widget.share.unitSharePrice.toString();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Center(
        child: Container(
          width: (MediaQuery.of(context).size.width < phoneSize)
              ? MediaQuery.of(context).size.width
              : 500,
          child: Column(
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          const FormElement(
                                            title: "First Name",
                                            important: true,
                                          ),
                                          const SizedBox(
                                            height: SSizes.spaceBtwItems / 2,
                                          ),
                                          TextFormField(
                                            controller: firstNameController,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Iconsax.user),
                                                labelText: "First Name"),
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
                                            title: "Last Name",
                                            important: true,
                                          ),
                                          const SizedBox(
                                            height: SSizes.spaceBtwItems / 2,
                                          ),
                                          TextFormField(
                                            controller: lastNameController,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Iconsax.user),
                                                labelText: 'Last Name'),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                            controller: nationalityController,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(
                                                    Iconsax.location_minus),
                                                labelText: 'Nationality'),
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
                                            controller: regionController,
                                            decoration: InputDecoration(
                                                prefixIcon:
                                                    Icon(Iconsax.location),
                                                labelText: 'Region'),
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
                                            title: "SubCity",
                                          ),
                                          const SizedBox(
                                            height: SSizes.spaceBtwItems / 2,
                                          ),
                                          TextFormField(
                                            controller: subCityController,
                                            decoration: InputDecoration(
                                                prefixIcon:
                                                    Icon(Iconsax.location_add5),
                                                labelText: "SubCity"),
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
                                            controller: woredaController,
                                            decoration: InputDecoration(
                                                prefixIcon:
                                                    Icon(Iconsax.location_tick),
                                                labelText: 'Woreda'),
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
                                      title: "Phone number",
                                    ),
                                    const SizedBox(
                                      height: SSizes.spaceBtwItems / 2,
                                    ),
                                    TextFormField(
                                      controller: phoneNumberController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Iconsax.call),
                                          labelText: "Phone number"),
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
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Iconsax.message),
                                          labelText: "Email"),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
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
                                            controller: sharePerPriceController,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Iconsax.money),
                                                labelText: 'Price Per share}'),
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
                                            controller: numberOfShareController,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Iconsax.user),
                                                labelText: "Number of Share"),
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
                                            title: "Payed Amount",
                                          ),
                                          const SizedBox(
                                            height: SSizes.spaceBtwItems / 2,
                                          ),
                                          TextFormField(
                                            controller: payedamountController,
                                            decoration: const InputDecoration(
                                                prefixIcon: Icon(
                                                    Iconsax.location_minus),
                                                labelText: "Payed Amount"),
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
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                ),
                                              ),
                                              items: items
                                                  .map((String item) =>
                                                      DropdownMenuItem<String>(
                                                        value: item,
                                                        child: Text(
                                                          item,
                                                          style:
                                                              const TextStyle(
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
                                    index: 3,
                                  ),
                                  SizedBox(
                                    height: SSizes.spaceBtwItems,
                                  ),
                                  Text(
                                    "Purchese Information",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.05,
                                  backgroundColor: Colors.grey[300]!,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AddMainImage(
                                      // file: _images![0],
                                      file: _kebleIdFront,
                                      deleteCallback: () {
                                        _deleteKebleIdFrontImage;
                                      },
                                      callback: () {
                                        _selectkebleIdFrontImage();
                                        // _selectImages();
                                      },
                                      text: 'Add Keble ID Front',
                                    ),
                                    AddMainImage(
                                      // file: _images![0],
                                      file: _kebleIdBack,
                                      deleteCallback: () {
                                        _deleteKebleIdBackImage();
                                      },
                                      callback: () {
                                        _selectKebleIdBackImage();
                                        // _selectImages();
                                      },
                                      text: 'Add Keble ID Back',
                                    ),
                                  ],
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
                    formIndex != 2
                        ? ElevatedButton(
                            onPressed: () {
                              setState(() {
                                formIndex++;
                              });
                            },
                            child: const Text("   Next   "))
                        : ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  content: Container(
                                    padding: EdgeInsets.all(20),
                                    height: 125,
                                    child: Column(
                                      children: [
                                        Text(
                                          "The totl Payment is  ${double.parse(numberOfShareController.text) * double.parse(sharePerPriceController.text) + widget.share.savingAccountPercentage / 100 * double.parse(numberOfShareController.text) * double.parse(sharePerPriceController.text)} Birr",
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.red),
                                                child:
                                                    const Text("   cancel   ")),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  createPurchase(
                                                      widget.share, user);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.green),
                                                child:
                                                    const Text("   Okay   ")),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.orange),
                            child: const Text("   Finish   ")),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddMainImage extends StatelessWidget {
  const AddMainImage({
    Key? key,
    required this.deleteCallback,
    required this.callback,
    this.file,
    required this.text,
  }) : super(key: key);
  final VoidCallback deleteCallback;

  final VoidCallback callback;
  final String text;
  // final PlatformFile? file;
  final Uint8List? file;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(34, 33, 149, 243), width: 2),
                        color: Colors.white,
                      ),
                      child: (file == null)
                          ? Container(
                              margin: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          text,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 10,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                        size: 30,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                // Image.file(
                                //   File(file!.path.toString()),
                                //   width: 400,
                                //   height: 430,
                                //   fit: BoxFit.cover,
                                // ),
                                Container(
                                  width: 400,
                                  height: 430,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: MemoryImage(file!))),
                                ),
                                IconButton(
                                    onPressed: deleteCallback,
                                    icon: const Icon(
                                      Icons.delete_outline_outlined,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
