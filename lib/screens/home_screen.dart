import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Fungsi untuk menangani aksi tombol "Kasir"
  void _onKasirPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tombol Kasir Ditekan')),
    );
  }

  // Fungsi untuk menangani aksi tombol "Stok Produk"
  void _onStokProdukPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tombol Stok Produk Ditekan')),
    );
  }

  // Fungsi untuk menangani aksi tombol "Pengaturan"
  void _onPengaturanPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tombol Pengaturan Ditekan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('iamges/bg2.jpg'), // Path gambar background
            fit: BoxFit.cover,  // Gambar menutupi seluruh area layar
            opacity: 0.5,  // Mengatur transparansi gambar agar teks lebih mudah dibaca
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto dan nama pengguna
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'), // Gambar profil
            ),
            SizedBox(height: 10),
            Text('Bobby', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            Text('Owner', style: TextStyle(fontSize: 16, color: Colors.white)),

            // Tombol Kasir
            ElevatedButton.icon(
              onPressed: _onKasirPressed,
              icon: Icon(Icons.money),
              label: Text('Kasir'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tombol Stok Produk
            ElevatedButton.icon(
              onPressed: _onStokProdukPressed,
              icon: Icon(Icons.storage),
              label: Text('Stok Produk'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tombol Pengaturan
            ElevatedButton.icon(
              onPressed: _onPengaturanPressed,
              icon: Icon(Icons.settings),
              label: Text('Pengaturan'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
