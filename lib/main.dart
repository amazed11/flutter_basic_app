import 'package:ecommerce/screens/splash/splash_screen.dart';
import 'package:ecommerce/services/shared_data.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedData.getSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
