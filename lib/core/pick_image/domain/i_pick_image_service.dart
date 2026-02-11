import 'package:image_picker/image_picker.dart';

abstract interface class IPickImageService {
  Future<XFile?> pickImageFromGallery();
}
