
import 'package:caffee_dashbord/home_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());

   
    
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
