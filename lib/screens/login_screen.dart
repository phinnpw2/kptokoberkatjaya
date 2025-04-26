import 'package:flutter/material.dart';
import 'home_screen.dart'; // Pastikan untuk mengimpor HomeScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk validasi login
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == '123' && password == '123') {
      // Jika login berhasil, arahkan ke HomeScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigasi ke HomeScreen
      );
    } else {
      // Jika login gagal, tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid username or password'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Warna latar belakang putih
        ),
        child: Column(
          children: <Widget>[
            // Background dengan gambar motif
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/motif.png'), // Pastikan path gambar motif
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Toko Berkat Jaya',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange.shade300, // Warna oranye
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Form login dengan warna oranye muda
            Expanded(
              child: Container(
                width: double.infinity,
                color: Color(0xFFFF7F50), // Warna oranye muda untuk login form
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Input Username
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          filled: true,
                          fillColor: Color(0xFFFFE0B2), // Warna peach muda
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 20),

                      // Input Password
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: Color(0xFFFFE0B2), // Warna peach muda
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 30),

                      // Tombol Login
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Tombol Log In putih
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(250, 50),
                        ),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 18, color: Colors.orange.shade500), // Warna oranye
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
