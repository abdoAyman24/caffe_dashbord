import 'dart:developer';
import 'dart:io';

import 'package:caffee_dashbord/Core/helper_function/show_error_message.dart';
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/manager/add_cubit/add_product_cubit.dart';
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/view/Widget/custom_text_form.dart';
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/view/Widget/image_picker.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/Entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingDataViewBody extends StatefulWidget {
  const AddingDataViewBody({super.key});

  @override
  State<AddingDataViewBody> createState() => _AddingDataViewBodyState();
}

class _AddingDataViewBodyState extends State<AddingDataViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String productId, name, additional, priceL, priceM, priceS, details;
  File? file;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextForm(
              hint: 'Product Id',
              onSave: (value) {
                productId = value!;
              },
              textInputType: TextInputType.text,
            ),
            CustomTextForm(
              hint: 'Name',
              onSave: (value) {
                name = value!;
              },
              textInputType: TextInputType.text,
            ),
            CustomTextForm(
              hint: 'Additional',
              onSave: (value) {
                additional = value!;
              },
              textInputType: TextInputType.text,
            ),
            CustomTextForm(
              hint: 'Price Large',
              onSave: (value) {
                priceL = value!;
              },
              textInputType: TextInputType.number,
            ),
            CustomTextForm(
              hint: 'Price Medium',
              onSave: (value) {
                priceM = value!;
              },
              textInputType: TextInputType.number,
            ),
            CustomTextForm(
              hint: 'Price Smalle',
              onSave: (value) {
                priceS = value!;
              },
              textInputType: TextInputType.number,
            ),
            CustomTextForm(
              hint: 'Details About Caffe',
              onSave: (value) {
                details = value!;
              },
              textInputType: TextInputType.text,
            ),
            AppImagePicker(
              file: (value) {
                log('${value}');
                file = value;
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  if (file != null) {
                    context.read<AddProductCubit>().addProduct(
                      product: ProductEntity(
                        productId: productId,
                        name: name,
                        additional: additional,
                        details: details,
                        priceS: num.parse(priceS),
                        priceM: num.parse(priceM),
                        priceL: num.parse(priceL),
                      ),
                      file: file!,
                    );
                  } else {
                    showMessage(context, 'Please Add image');
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 40, 53, 236),
                ),
                child: Center(
                  child: Text(
                    'Add Product',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
