import 'package:flutter/material.dart';
import 'product_detail_screen.dart';
import 'swipping_screen.dart';
import 'pengaturan_screen.dart';  // Impor PengaturanScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SwippingScreen(
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white.withOpacity(0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/your_avatar.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bobby', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Owner', style: TextStyle(fontSize: 16, color: Colors.grey)),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {}, // Logic untuk button Owner jika ada
                  child: Text('Owner'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    backgroundColor: Colors.purple,
                  ),
                ),
              ],
            ),
          ),

          // Scroll Horizontal Buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                _buildMainButton(
                  icon: Icons.payment,
                  label: 'Kasir',
                  onPressed: () {},
                ),
                _buildMainButton(
                  icon: Icons.inventory,
                  label: 'Stok Produk',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          productName: 'Produk A',
                          productStock: 100,
                        ),
                      ),
                    );
                  },
                ),
                _buildMainButton(
                  icon: Icons.bar_chart,
                  label: 'Laporan',
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Pengaturan Button
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: screenWidth * 0.9,
              height: 150,
              child: Card(
                color: Colors.white,
                elevation: 5,
                child: InkWell(
                  onTap: () {
                    // Navigasi ke PengaturanScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PengaturanScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings, size: 30, color: Colors.purple),
                      SizedBox(width: 10),
                      Text('Pengaturan', style: TextStyle(fontSize: 14, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 200,
        height: 150,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40),
              Text(label, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
