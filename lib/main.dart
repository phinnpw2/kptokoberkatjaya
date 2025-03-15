import 'package:flutter/material.dart';
import 'screens/login_screen.dart';  // Pastikan path ini benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),  // Memastikan LoginScreen muncul pertama kali
    );
  }
}
