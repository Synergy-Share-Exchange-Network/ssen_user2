import 'package:ssen_user/Models/secondry_post_share.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/Models/user_model.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_purchase_methods.dart';
import 'package:ssen_user/utils/date_method.dart';
import 'package:uuid/uuid.dart';

import '../../../../Models/purchase_model.dart';

class FirebaseSecondaryPurchaseBuyServiceMethod {
  Future<String> createSecondaryMarketBuy(SecondryPostShareModel secondary,
      ShareModel share, UserModel user) async {
    print('inside');
    String res = "some error has occured";
    try {
      PurchaseModel purchase = PurchaseModel();
      String date = await DateMethod().getCurrentDateAndTime();
      purchase.identification = Uuid().v1();
      purchase.firstName = user.firstName;
      purchase.lastName = user.lastName;
      purchase.companyID = share.companyID;
      purchase.phoneNumber = user.phoneNumber;
      purchase.date = date;
      purchase.userID = user.identification;
      purchase.secondaryId = secondary.identification;

      //Creates secondary buy request
      purchase.shareID = share.identification;
      purchase.secondaryId = secondary.identification;
      purchase.isSecondary = true;
      purchase.requestSent = [
        'true',
        date,
      ];
      //update purchase information to the database
      purchase.pendingPayment = ['secondary'];
      purchase.acceptedPayment = ['secondary'];
      // FirebasePurchaseMethods()
      //     .update(purchase.identification, 'requestSent', purchase.requestSent);
      // FirebasePurchaseMethods().update(
      //     purchase.identification, 'pendingPayment', purchase.pendingPayment);
      // FirebasePurchaseMethods().update(
      //     purchase.identification, 'acceptedPayment', purchase.acceptedPayment);
      // FirebasePurchaseMethods()
      //     .update(purchase.identification, 'isSecondary', purchase.isSecondary);
      print("7777777777777777777777777777777777777777");
      print(purchase);
      print("7777777777777777777777777777777777777777");
      FirebasePurchaseMethods().create(purchase, share, user);

      //Asks verification by calling verifyCompany()
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  // Future<String> verifyRequest(SecondryPostShareModel secondary) async {
  //   String res = "some error has occured";
  //   try {
  //     String date = await DateMethod().getCurrentDateAndTime();
  //     res = "Success";
  //   } catch (e) {
  //     res = e.toString();
  //   }
  //   //save purchase information to the database

  //   return res;
  // }

  Future<String> requestDeclineAcceptance(
      PurchaseModel purchase, String reason, bool acceptOrDecline) async {
    //ACCEPT DECLINE REQUEST
    String res = "some error has occured";
    try {
      String date = await DateMethod().getCurrentDateAndTime();
      if (acceptOrDecline) {
        purchase.requestAccepted = [
          'true',
          date,
        ];
      } else {
        purchase.requestAccepted = ['false', date, reason];
      }
      //notify purchase
      //if decline

      //update purchase information to the database
      FirebasePurchaseMethods().update(
          purchase.identification, 'requestAccepted', purchase.requestAccepted);
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    //save purchase information to the database

    return res;
  }

  Future<String> generateInvoice(SecondryPostShareModel secondary) async {
    // GENERATE PDF
    String res = "some error has occured";
    try {
      String date = await DateMethod().getCurrentDateAndTime();
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    //save purchase information to the database

    return res;
  }

  Future<String> confirmTransaction(
      PurchaseModel purchase, bool iscomplited, String reason) async {
    String res = "some error has occured";
    try {
      String date = await DateMethod().getCurrentDateAndTime();
      if (iscomplited) {
        purchase.successfullyBought = [
          'true',
          date,
        ];
      } else {
        purchase.successfullyBought = ['false', date, reason];
      }
      res = "Success";
    } catch (e) {
      res = e.toString();
    }
    //save purchase information to the database

    return res;
  }
}
