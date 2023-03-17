import 'package:image_picker/image_picker.dart';

import '../../models/user_model.dart';

abstract class BaseStorageRepository {
  Future<void> uploadImage(User user, XFile image);
  Future<String> getDownloadURL(User user, String imageName);
}
