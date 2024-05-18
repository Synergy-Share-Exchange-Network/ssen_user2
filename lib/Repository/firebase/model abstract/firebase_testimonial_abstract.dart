import 'package:ssen_user/Models/company_profile_model.dart';
import 'package:ssen_user/Models/testimonial_model.dart';

abstract class FirebaseTestimonialAbstract {
  Future<String> create(
      CompanyProfileModel companyProfileModel, TestimonialModel testimonial);
  Future<String> delete(String id);
  Future<String> update(CompanyProfileModel companyProfileModel);
  Future<TestimonialModel> read(String id);
}
