import 'dart:developer';

import 'package:caffee_dashbord/Core/Utils/back_end_point.dart';
import 'package:caffee_dashbord/Core/error/auth_faluire_service.dart';
import 'package:caffee_dashbord/Core/sevice/data_base_service.dart';
import 'package:caffee_dashbord/Feature/Add_Data/data/Model/product_model.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/Entity/product_entity.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/repo/add_repo.dart';
import 'package:dartz/dartz.dart';

class AddRepoImple implements AddRepo {
  final DataBaseService dataBaseService;
  AddRepoImple(this.dataBaseService);

  @override
  Future<Either<Failure, void>> addData({
    required ProductEntity product,
  }) async {
    try {
      await dataBaseService.addData(
        data: ProductModel.fromEntity(product).toJson(),
        path: BackEndPoint.product,
        productId: product.productId,
      );

      return Right(null);
    } catch (e) {
      log('Error When Add Data');
      log(e.toString());
      return left(ServerFailure(message: 'Error When Add Data'));
    }
  }
}
