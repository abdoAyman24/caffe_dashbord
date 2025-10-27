import 'dart:io';

import 'package:caffee_dashbord/Core/error/auth_faluire_service.dart';
import 'package:dartz/dartz.dart';

abstract class UploadImageRepo {
   Future<Either<Failure,String>> uploadImage({required File file});
}