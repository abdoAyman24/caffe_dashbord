
import 'package:caffee_dashbord/Feature/Add_Data/Presentation/view/Widget/adding_data_view.dart';
import 'package:caffee_dashbord/home_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());
case AddingDataView.routeName:
      return MaterialPageRoute(builder: (context) => AddingDataView());

   
    
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
