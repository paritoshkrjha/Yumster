import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToFirebaseStorage({
    required String fileName,
    required Uint8List file,
  }) async {
    Reference ref = _storage.ref().child(fileName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
