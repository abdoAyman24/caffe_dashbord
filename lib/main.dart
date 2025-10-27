import 'package:caffee_dashbord/Core/Utils/AppTheme.dart';
import 'package:caffee_dashbord/Core/helper_function/on_generate_route.dart';
import 'package:caffee_dashbord/Core/sevice/service_locator.dart';
import 'package:caffee_dashbord/firebase_options.dart';
import 'package:caffee_dashbord/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Supabase.initialize(
    url: 'https://wffygksikhphlzgvmvib.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndmZnlna3Npa2hwaGx6Z3ZtdmliIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MTU3Mzc4OCwiZXhwIjoyMDc3MTQ5Nzg4fQ.4dHFExXP_8gTyNhkNsk_Xmh-fCJ1Fu_mwlpr0r5VOAY',
  );
  setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme,

      onGenerateRoute: onGenerateRoute,
      initialRoute: HomeView.routeName,
    );
  }
}
