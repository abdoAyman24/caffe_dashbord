import 'package:caffee_dashbord/Core/sevice/service_locator.dart';
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/manager/add_cubit/add_product_cubit.dart';
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/view/Widget/adding_data_view_body_bloc_consumer.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/repo/add_repo.dart';
import 'package:caffee_dashbord/Feature/Add_Data/domain/repo/upload_image_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingDataView extends StatelessWidget {
  const AddingDataView({super.key});
  static const String routeName = 'AddingDataView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddProductCubit(getIt.get<AddRepo>(), getIt.get<UploadImageRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Data'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        body: AddingDataViewBodyBlocConsumer(),
      ),
    );
  }
}
