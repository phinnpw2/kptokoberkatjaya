import 'package:flutter/material.dart';
import 'product_detail_screen.dart'; // Import layar detail produk

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

  // Fungsi untuk menangani aksi tombol "Kasir"
  void _onKasirPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tombol Kasir Ditekan')),
    );
  }

  // Fungsi untuk menavigasi ke halaman detail produk
  void _navigateToProductDetail() {
    // Menavigasi ke halaman ProductDetailScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          productName: 'Produk A',  // Nama produk yang diteruskan
          productStock: 10,  // Stok produk yang diteruskan
        ),
      ),
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
      body: Center(  // Menggunakan Center untuk menempatkan tombol di tengah
        child: Column(  // Menambahkan Column untuk menempatkan tombol secara vertikal
          mainAxisAlignment: MainAxisAlignment.center,  // Memastikan tombol di tengah secara vertikal
          children: [
            ElevatedButton(
              onPressed: _onKasirPressed,  // Aksi tombol Kasir
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Warna tombol Kasir mengikuti tombol Produk
                minimumSize: Size(200, 50),  // Menentukan ukuran minimal tombol
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Membuat tombol melengkung
                ),
              ),
              child: const Text(
                'Kasir', // Teks tombol Kasir
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),  // Jarak antara tombol Kasir dan Produk
            ElevatedButton(
              onPressed: _navigateToProductDetail,  // Navigasi ke halaman detail produk
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent, // Warna tombol Produk
                minimumSize: Size(200, 50),  // Menentukan ukuran minimal tombol
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Membuat tombol melengkung
                ),
              ),
              child: const Text(
                'Produk', // Teks tombol Produk
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
