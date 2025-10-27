import 'package:caffee_dashbord/Core/helper_function/show_error_message.dart';
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/manager/add_cubit/add_product_cubit.dart';
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/view/Widget/adding_data_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddingDataViewBodyBlocConsumer extends StatelessWidget {
  const AddingDataViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductFailure) {
          showMessage(context, state.errorMessage);
        } else if (state is AddProductSuccess) {
          showMessage(context, 'product Add');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddProductLoad,
          child: AddingDataViewBody(),
        );
      },
    );
  }
}
