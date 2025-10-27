import 'package:caffee_dashbord/Core/Utils/AppTheme.dart';
import 'package:caffee_dashbord/Core/helper_function/on_generate_route.dart';
import 'package:caffee_dashbord/Core/sevice/service_locator.dart';
import 'package:caffee_dashbord/firebase_options.dart';
import 'package:caffee_dashbord/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   
  setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: AppTheme,
      
      onGenerateRoute: onGenerateRoute,
      initialRoute: HomeView.routeName,
    );
  }
}
