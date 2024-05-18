import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/log_model.dart';
import 'package:ssen_user/Models/share_model.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_company_profile_methods.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_company_requirements_methods.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_log_methods.dart';
import 'package:ssen_user/Repository/firebase/model%20methods/firebase_share_methods.dart';

import '../../../Models/company_requirement_on_secondry_market_model.dart';
import '../../../Models/user_model.dart';
import '../model methods/firebase_update_methods.dart';

class FirebaseCompanyServiceMethod {
  Future<String> createCompany(CompanyProfileModel company) async {
    String res = "some error has occured";
    try {
      res = await FirebaseCompanyProfileMethods().create(company);
      // res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> verifyOrRejectCompany(CompanyProfileModel company,
      String reason, bool acceptOrDecline, UserModel admin) async {
    String res = "some error has occured";
    //if accepted
    try {
      if (acceptOrDecline) {
        company.isVerified = true;
      } else {
        company.isVerified = false;
      }
      FirebaseUpdateMethodUser().update(admin, company.identification, reason,
          'isVerified', company.isVerified, CompanyProfileModel);
      FirebaseLogMethods().create(
          admin,
          company.identification,
          ModifiedEntity.organizationProfile,
          LogLevel.critical,
          LogAction.modification,
          reason,
          ['']);
      //notify verification througn push notification and email

      res = "Success";
    } catch (e) {
      // TODO
      res = e.toString();
    }

    return res;
  }

  Future<String> addShare(ShareModel share, CompanyProfileModel company) async {
    String res = "some error has occured";
    try {
      FirebaseShareMethods().create(share, company);
      //if it need to be saved to log think about it roba.
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> addSecondaryMarketRequirement(CompanyProfileModel company,
      CompanyRequirementOnSecondryMarketModel requirement) async {
    String res = "some error has occured";
    try {
      FirebaseCompanyRequirementsMethods()
          .create(company.identification, requirement);
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> editProfile() async {
    String res = "some error has occured";
    try {
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> hideCompany(CompanyProfileModel company, String reason,
      bool toBeHidden, UserModel admin) async {
    String res = "some error has occured";
    try {
      FirebaseUpdateMethodUser().update(admin, company.identification, reason,
          'isHidden', toBeHidden, CompanyProfileModel);
      FirebaseLogMethods().create(
          admin,
          company.identification,
          ModifiedEntity.organizationProfile,
          LogLevel.critical,
          LogAction.modification,
          reason,
          ['']);
      //notify verification througn push notification and email
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future<String> banCompany(CompanyProfileModel company, String reason,
      bool toBeBanned, UserModel admin) async {
    String res = "some error has occured";
    try {
      FirebaseUpdateMethodUser().update(admin, company.identification, reason,
          'isBanned', toBeBanned, CompanyProfileModel);
      FirebaseLogMethods().create(
          admin,
          company.identification,
          ModifiedEntity.organizationProfile,
          LogLevel.critical,
          LogAction.modification,
          reason,
          ['']);
      //notify verification througn push notification and email
      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
