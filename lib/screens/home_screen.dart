import 'package:flutter/material.dart';
import 'product_detail_screen.dart';  // Pastikan ini sudah ada

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/bg1.jpg',  // Ganti dengan path gambar latar belakang yang sesuai
              fit: BoxFit.cover,
            ),
          ),
          // Content on top of the background
          Column(
            children: [
              // Header with user info
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.white.withOpacity(0.8),  // Semi-transparent background
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,  // Ukuran avatar
                      backgroundImage: AssetImage('assets/your_avatar.png'),  // Ganti dengan path gambar avatar
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bobby',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'popo',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Owner'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: Colors.purple,  // Warna tombol
                      ),
                    ),
                  ],
                ),
              ),
              // Main buttons (Kasir, Stok Produk, Laporan)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row untuk tombol utama
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Kasir Button
                        Padding(
                          padding: EdgeInsets.all(8.0),  // Menambah jarak sekitar tombol
                          child: Container(
                            width: 230,  // Ukuran tombol
                            height: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,  // Warna tombol
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.payment, size: 40),
                                  Text('Kasir', style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Stok Produk Button
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: 230,  // Ukuran tombol
                            height: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigasi ke ProductDetailScreen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailScreen(
                                      productName: 'Produk A',  // Nama produk yang diteruskan
                                      productStock: 100,        // Jumlah stok produk yang diteruskan
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.inventory, size: 40),
                                  Text('Stok Produk', style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Laporan Button
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: 230,
                            height: 150,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.bar_chart, size: 40),
                                  Text('Laporan', style: TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Tombol Pengaturan yang memanjang ke bawah
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 720,   // Menambahkan pengaturan ukuran lebar tombol
                        height: 150,   // Menambahkan pengaturan ukuran tinggi tombol
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.settings, size: 30, color: Colors.purple),
                                SizedBox(width: 10),  // Menambahkan ruang antara ikon dan teks
                                Text('Pengaturan', style: TextStyle(fontSize: 14, color: Colors.black)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
