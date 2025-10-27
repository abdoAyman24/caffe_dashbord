import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/Entity/product_entity.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/repo/add_repo.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/repo/upload_image_repo.dart';
import 'package:equatable/equatable.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.addRepo, this.uploadImageRepo)
    : super(AddProductInitial());
  final AddRepo addRepo;
  final UploadImageRepo uploadImageRepo;

  Future<void> addProduct({
    required ProductEntity product,
    required File file,
  }) async {
    emit(AddProductLoad());
    var image = await uploadImageRepo.uploadImage(file: file);

    image.fold(
      (l) {
        emit(AddProductFailure(errorMessage: l.message));
      },
      (url) async {
        product.imageUrl = url;
        var result = await addRepo.addData(product: product);
        result.fold(
          (l) {
            emit(AddProductFailure(errorMessage: l.message));
          },
          (r) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
