import '../../../Models/log_model.dart';
import '../../../Models/user_model.dart';

abstract class FirebaseLogAbstract {
  Future<String> create(
      // UserRole role,
      UserModel user,
      String id,
      String entity,
      String level,
      String action,
      String reason,
      List<String> whatChanged);
  // Future<String> delete(String id);
  // Future<String> update(CompanyProfileModel companyProfileModel);
  Future<LogModel> read(String id);
}
