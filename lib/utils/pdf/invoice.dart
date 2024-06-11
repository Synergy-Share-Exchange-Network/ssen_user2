import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';
import '../../Models/purchase_model.dart';
// import '../Models/purchase_model.dart';
import '../utils.dart';
// import '../utils/utils.dart';

Future<Uint8List> generatePDF(
    PdfPageFormat pageFormat, Future<PurchaseModel> data) async {
  try {
    final purchaseModel = await data;

    final backgroundImage1 =
        await _loadNetworkImage(getImage(purchaseModel.finishedPDF[0]));
    final backgroundImage2 =
        await _loadNetworkImage(getImage(purchaseModel.finishedPDF[1]));
    final backgroundImage3 =
        await _loadNetworkImage(getImage(purchaseModel.finishedPDF[2]));
    final backgroundImage4 =
        await _loadNetworkImage(getImage(purchaseModel.finishedPDF[3]));

    final invoice = Invoice(
      backgroundImage1: backgroundImage1,
      backgroundImage2: backgroundImage2,
      backgroundImage3: backgroundImage3,
      backgroundImage4: backgroundImage4,
    );

    return await invoice.buildPdf(pageFormat);
  } catch (e) {
    print('Error generating invoice: $e');
    rethrow;
  }
}

Future<Uint8List> _loadNetworkImage(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception(
          'Failed to load image from network with status code ${response.statusCode}');
    }
  } catch (e) {
    print('Error loading image: $e');
    throw Exception('Failed to load image from network: $e');
  }
}

class Invoice {
  final Uint8List backgroundImage1;
  final Uint8List backgroundImage2;
  final Uint8List backgroundImage3;
  final Uint8List backgroundImage4;

  Invoice({
    required this.backgroundImage1,
    required this.backgroundImage2,
    required this.backgroundImage3,
    required this.backgroundImage4,
  });

  Future<Uint8List> buildPdf(PdfPageFormat pageFormat) async {
    final pdf = pw.Document();

    final font = await PdfGoogleFonts.montserratRegular();

    // Adding four pages with different background images
    pdf.addPage(
      pw.Page(
        pageTheme: _buildTheme(pageFormat, backgroundImage1, font),
        build: (context) => pw.Container(),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageTheme: _buildTheme(pageFormat, backgroundImage2, font),
        build: (context) => pw.Container(),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageTheme: _buildTheme(pageFormat, backgroundImage3, font),
        build: (context) => pw.Container(),
      ),
    );

    pdf.addPage(
      pw.Page(
        pageTheme: _buildTheme(pageFormat, backgroundImage4, font),
        build: (context) => pw.Container(),
      ),
    );

    return pdf.save();
  }

  pw.PageTheme _buildTheme(
      PdfPageFormat pageFormat, Uint8List backgroundImage, pw.Font font) {
    return pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Image(pw.MemoryImage(backgroundImage), fit: pw.BoxFit.cover),
      ),
    );
  }
}
