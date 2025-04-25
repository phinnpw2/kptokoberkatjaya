import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final int productStock;

  // Constructor untuk menerima data produk dari layar sebelumnya
  ProductDetailScreen({required this.productName, required this.productStock});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: SingleChildScrollView( // Memungkinkan scroll jika konten lebih panjang dari layar
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // Menambahkan Row untuk bagian makanan dan minuman
            // Gunakan MediaQuery untuk mendeteksi layar besar atau kecil
            if (MediaQuery.of(context).size.width > 600) // Desktop / tablet
              Row(
                children: [
                  // Bagian kiri: Makanan
                  Expanded(
                    flex: 1,  // Makanan mendapat 1/2 dari ruang yang tersedia
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Makanan',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        // Daftar makanan
                        ListTile(
                          title: Text(
                            'Makanan A',
                            style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
                          ),
                          subtitle: Text('Stok: 10'),
                          trailing: TextButton(
                            onPressed: () {
                              // Aksi untuk menambah stok makanan A
                            },
                            child: Text('Edit Produk', style: TextStyle(fontSize: 18, color: Colors.blue)),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Makanan B',
                            style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
                          ),
                          subtitle: Text('Stok: 8'),
                          trailing: TextButton(
                            onPressed: () {
                              // Aksi untuk menambah stok makanan B
                            },
                            child: Text('Edit Produk', style: TextStyle(fontSize: 18, color: Colors.blue)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Garis pemisah di tengah
                  VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    width: 20,
                  ),
                  // Bagian kanan: Minuman
                  Expanded(
                    flex: 1,  // Minuman mendapat 1/2 dari ruang yang tersedia
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Minuman',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        // Daftar minuman
                        ListTile(
                          title: Text(
                            'Minuman A',
                            style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
                          ),
                          subtitle: Text('Stok: 15'),
                          trailing: TextButton(
                            onPressed: () {
                              // Aksi untuk menambah stok minuman A
                            },
                            child: Text('Edit Produk', style: TextStyle(fontSize: 18, color: Colors.blue)),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Minuman B',
                            style: TextStyle(fontSize: 14), // Ukuran font lebih kecil
                          ),
                          subtitle: Text('Stok: 12'),
                          trailing: TextButton(
                            onPressed: () {
                              // Aksi untuk menambah stok minuman B
                            },
                            child: Text('Edit Produk', style: TextStyle(fontSize: 18, color: Colors.blue)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            else // Mobile, menampilkan bagian makanan dan minuman secara vertikal
              Column(
                children: [
                  // Bagian Makanan
                  Text(
                    'Makanan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('Makanan A'),
                    subtitle: Text('Stok: 10'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Aksi untuk menambah stok makanan A
                      },
                      child: Text('Tambah Stok'),
                    ),
                  ),
                  ListTile(
                    title: Text('Makanan B'),
                    subtitle: Text('Stok: 8'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Aksi untuk menambah stok makanan B
                      },
                      child: Text('Tambah Stok'),
                    ),
                  ),
                  Divider(),
                  // Bagian Minuman
                  Text(
                    'Minuman',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    title: Text('Minuman A'),
                    subtitle: Text('Stok: 15'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Aksi untuk menambah stok minuman A
                      },
                      child: Text('Tambah Stok'),
                    ),
                  ),
                  ListTile(
                    title: Text('Minuman B'),
                    subtitle: Text('Stok: 12'),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Aksi untuk menambah stok minuman B
                      },
                      child: Text('Tambah Stok'),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
