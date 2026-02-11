import 'package:image_picker/image_picker.dart';
import 'package:skenteas/core/pick_image/domain/i_pick_image_service.dart';

final class ImagePickerService implements IPickImageService {
  final ImagePicker imagePicker;

  ImagePickerService({required this.imagePicker});

  @override
  Future<XFile?> pickImageFromGallery() async {
    return await imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 600,
      imageQuality: 85,
    );
  }
}
