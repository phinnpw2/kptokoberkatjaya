import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Fungsi untuk menangani aksi tombol "Produk"
  void _onProdukPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tombol Produk Ditekan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berkat Jaya'),
        leading: IconButton(
          icon: const Icon(Icons.shopping_cart),  // Ikon untuk produk
          onPressed: _onProdukPressed,  // Fungsi yang dijalankan saat tombol ditekan
          tooltip: 'Produk',  // Tooltip untuk tombol
        ),
      ),
      body: Stack(  // Menggunakan Stack untuk meletakkan tombol di atas kiri
        children: [
          Center(
            child: const Text(
              'Nelson Cinta Medi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.topLeft, // Menempatkan tombol di atas kiri
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Padding dari tepi layar
              child: ElevatedButton(
                onPressed: _onProdukPressed, // Fungsi yang dipanggil saat tombol ditekan
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Warna tombol
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Membuat tombol melengkung
                  ),
                ),
                child: const Text(
                  'Stok Produk', // Teks yang ada di dalam tombol
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
