import 'dart:developer';
import 'dart:io';

import 'package:caffee_dashbord/Core/Utils/back_end_point.dart';
import 'package:caffee_dashbord/Core/error/auth_faluire_service.dart';
import 'package:caffee_dashbord/Core/sevice/store_service.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/repo/upload_image_repo.dart';
import 'package:dartz/dartz.dart';

class UploadImageRepoImpl implements UploadImageRepo {
  final StoreService storeService;

  UploadImageRepoImpl({required this.storeService});

  @override
  Future<Either<Failure, String>> uploadImage({required File file}) async {
    try {
      String imageUrle = await storeService.uploadImage(
        file: file,
        path: BackEndPoint.image,
      );
      return Right(imageUrle);
    } catch (e) {
      log('Error When upload image');
      log(e.toString());

      return left(ServerFailure(message: 'Error When Upload Image'));
    }
  }
}
