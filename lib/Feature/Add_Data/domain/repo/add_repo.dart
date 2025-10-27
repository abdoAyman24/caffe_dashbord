
import 'package:caffee_dashbord/Core/error/auth_faluire_service.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/Entity/product_entity.dart';
import 'package:dartz/dartz.dart';


abstract class AddRepo {
  Future<Either<Failure,void>> addData({required ProductEntity product});
 
}
