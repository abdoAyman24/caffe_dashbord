import 'dart:io';

abstract class StoreService {
  Future<String> uploadImage({required File file,required String path});
}
