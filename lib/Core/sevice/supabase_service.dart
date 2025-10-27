import 'dart:io';

import 'package:caffee_dashbord/Core/sevice/store_service.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService implements StoreService {
  @override
  Future<String> uploadImage({required File file, required String path}) async {
    String fileName = b.basename(file.path);
    String fileExtention = b.extension(file.path);
    await Supabase.instance.client.storage
        .from('caffe_images')
        .upload('$path/$fileName$fileExtention', file);

    String imageUrl = Supabase.instance.client.storage
        .from('caffe_images')
        .getPublicUrl('$path/$fileName$fileExtention');
    return imageUrl;
  }
}
