import 'package:caffee_dashbord/Feature/Add_Data/Presentation/view/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}
