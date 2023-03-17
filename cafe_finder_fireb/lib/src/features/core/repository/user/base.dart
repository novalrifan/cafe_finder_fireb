import '../../models/this_user_model.dart';

abstract class BaseUserRepo {
  Stream<User> getUser(String userId);
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
}
