import 'package:flutter/material.dart';
import 'home_screen.dart'; // Pastikan untuk mengimpor HomeScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // Fungsi untuk validasi login
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == '123' && password == '123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), // Navigasi ke HomeScreen
      );
    } else {
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
          image: DecorationImage(
            image: AssetImage('images/bg1.jpg'), // Gambar background yang dipakai
            fit: BoxFit.cover, // Agar gambar mengisi seluruh background
            opacity: 1, // Transparansi untuk gambar agar teks lebih jelas
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Logo bintang di atas teks
                Icon(
                  Icons.star, // Gunakan icon bintang
                  size: 60,
                  color: Colors.orange, // Warna bintang oranye
                ),
                SizedBox(height: 20),

                // Menampilkan teks nama perusahaan
                Text(
                  'Toko Berkat Jaya',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 12, 12, 12), 
                  ),
                ),
                SizedBox(height: 20),

                // Form login dengan warna putih
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white, // Warna putih untuk form login
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // shadow direction
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        // Input Username
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            filled: true,
                            fillColor: Colors.grey.shade200, // Warna peach muda
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 20),

                        // Input Password dengan ikon mata
                        TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible, // Kontrol visibilitas password
                          decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.grey.shade200, // Warna peach muda
                            contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 30),

                        // Tombol Login
                        ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Tombol Log In hitam
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            minimumSize: Size(250, 50),
                          ),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Teks bawah untuk aplikasi kasir
                Text(
                  'Aplikasi Kasir dan Stok Produk',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
