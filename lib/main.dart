import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart'; // ✅ Import Hive
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Wajib sebelum async init
  await Hive.initFlutter();                 // ✅ Inisialisasi Hive
  await Hive.openBox('produkBox');          // ✅ Buka box untuk simpan data

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
      home: LoginScreen(),
    );
  }
}
