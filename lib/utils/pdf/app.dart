import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:ssen_user/utils/pdf/invoice.dart';
// import 'package:fluttertoast/fluttertoast.dart';

import 'package:uuid/uuid.dart';
import 'package:uuid/v8.dart';
import 'package:pdf/widgets.dart' as pw;
// import 'data.dart';
import '../../Models/purchase_model.dart';
import '../../Repository/firebase/model methods/firebase_purchase_methods.dart';

class Pdf1 extends StatefulWidget {
  final PurchaseModel purchase;

  const Pdf1({
    Key? key,
    required this.purchase,
  }) : super(key: key);

  @override
  Pdf1State createState() => Pdf1State();
}

class Pdf1State extends State<Pdf1> {
  PrintingInfo? printingInfo;
  late Future<PurchaseModel> _data;

  @override
  void initState() {
    super.initState();
    _data = FirebasePurchaseMethods().read(widget.purchase.identification);
    _init();
  }

  /// Fetches printing information.
  Future<void> _init() async {
    try {
      final info = await Printing.info();
      setState(() {
        printingInfo = info;
      });
    } catch (e) {
      print('Error initializing printing info: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error initializing printing info: $e'),
        ),
      );
    }
  }

  // Fluttertoast.showToast(
  //   msg: "PDF downloaded successfully!",
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity: ToastGravity.BOTTOM,
  //   timeInSecForIosWeb: 1,
  //   backgroundColor: Colors.green,
  //   textColor: Colors.white,
  //   fontSize: 16.0,
  // );

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

    if (printingInfo == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase verfication'),
        actions: [],
      ),
      body: PdfPreview(
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        // onShared: ,
        // onShared,
        maxPageWidth: 700,
        build: (format) => generatePDF(format,
            _data), // Use the generateInvoice function from invoice.dart
      ),
    );
  }
}
