import 'package:caffee_dashbord/Core/sevice/data_base_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireBaseService implements DataBaseService {
  @override
  Future<void> addData({
    required Map<String, dynamic> data,
    required String path,
    required String productId,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection(path).doc(productId).set(data);
  }
}
