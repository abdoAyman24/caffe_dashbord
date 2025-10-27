import 'package:caffee_dashbord/Feature/Add_Data/Presentation/view/Widget/adding_data_view.dart';
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/view/Widget/custom_botton.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomBotton(
            headText: 'Add Coffee Item Data:',
            bottonText: 'Add  Data',
            onTap: () {
              Navigator.pushNamed(context, AddingDataView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
