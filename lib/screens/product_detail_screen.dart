import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productName;
  final int productStock;

  ProductDetailScreen({required this.productName, required this.productStock});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List<Map<String, dynamic>> makananList = [];
  List<Map<String, dynamic>> minumanList = [];
  String _filterKategori = 'Semua'; // Filter kategori
  String _filterSort = 'Default'; // Filter sorting
  String _searchQuery = ''; // Tambahan: Query pencarian

  final TextEditingController _searchController = TextEditingController(); // Controller search

  @override
  void initState() {
    super.initState();
    _loadProdukData();
  }

  void _loadProdukData() {
    final box = Hive.box('produkBox');
    final makananData = box.get('makananList');
    final minumanData = box.get('minumanList');

    if (makananData != null) {
      makananList = List<Map<String, dynamic>>.from(
        (makananData as List).map((e) => Map<String, dynamic>.from(e)),
      );
    }

    if (minumanData != null) {
      minumanList = List<Map<String, dynamic>>.from(
        (minumanData as List).map((e) => Map<String, dynamic>.from(e)),
      );
    }

    setState(() {});
  }

  void _saveProdukData() {
    final box = Hive.box('produkBox');
    box.put('makananList', makananList);
    box.put('minumanList', minumanList);
  }

  void _showAddItemDialog(BuildContext context, String kategori) {
    final TextEditingController _namaController = TextEditingController();
    final TextEditingController _stokController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah $kategori'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama $kategori'),
              ),
              TextField(
                controller: _stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Stok'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                String nama = _namaController.text.trim();
                int stok = int.tryParse(_stokController.text.trim()) ?? 0;

                if (nama.isNotEmpty) {
                  setState(() {
                    final newItem = {'nama': nama, 'stok': stok};
                    if (kategori == 'Makanan') {
                      makananList.add(newItem);
                    } else {
                      minumanList.add(newItem);
                    }
                    _saveProdukData();
                  });
                }
                Navigator.pop(context);
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  void _showEditItemDialog(BuildContext context, String kategori, int index) {
    final list = kategori == 'Makanan' ? makananList : minumanList;
    final TextEditingController _namaController = TextEditingController(text: list[index]['nama']);
    final TextEditingController _stokController = TextEditingController(text: list[index]['stok'].toString());

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $kategori'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama $kategori'),
              ),
              TextField(
                controller: _stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Stok'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  list[index]['nama'] = _namaController.text.trim();
                  list[index]['stok'] = int.tryParse(_stokController.text.trim()) ?? list[index]['stok'];
                  _saveProdukData();
                });
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  list.removeAt(index);
                  _saveProdukData();
                });
                Navigator.pop(context);
              },
              child: Text('Hapus', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Fungsi sortir berdasarkan stok
  List<Map<String, dynamic>> _getSortedList(List<Map<String, dynamic>> list) {
    List<Map<String, dynamic>> sortedList = List<Map<String, dynamic>>.from(list);
    if (_filterSort == 'Stok Terbanyak') {
      sortedList.sort((a, b) => b['stok'].compareTo(a['stok']));
    } else if (_filterSort == 'Stok Terdikit') {
      sortedList.sort((a, b) => a['stok'].compareTo(b['stok']));
    }
    return sortedList;
  }

  // Fungsi untuk search berdasarkan nama produk
  List<Map<String, dynamic>> _getFilteredList(List<Map<String, dynamic>> list) {
    List<Map<String, dynamic>> sortedList = _getSortedList(list);
    if (_searchQuery.isEmpty) return sortedList;
    return sortedList.where((item) => item['nama'].toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  Widget _buildItemList(List<Map<String, dynamic>> list, String jenis) {
    List<Map<String, dynamic>> finalList = _getFilteredList(list);
    return Column(
      children: List.generate(finalList.length, (index) {
        return ListTile(
          title: Text(finalList[index]['nama'], style: TextStyle(fontSize: 14)),
          subtitle: Text('Stok: ${finalList[index]['stok']}'),
          trailing: TextButton(
            onPressed: () => _showEditItemDialog(context, jenis, index),
            child: Text('Edit', style: TextStyle(fontSize: 12, color: Colors.blue)),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row untuk Filter Kategori dan Sort Stok
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Filter:', style: TextStyle(fontSize: 16)),
                    DropdownButton<String>(
                      value: _filterKategori,
                      items: ['Semua', 'Makanan', 'Minuman']
                          .map((kategori) => DropdownMenuItem(
                                value: kategori,
                                child: Text(kategori),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _filterKategori = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sort Stok:', style: TextStyle(fontSize: 16)),
                    DropdownButton<String>(
                      value: _filterSort,
                      items: ['Default', 'Stok Terbanyak', 'Stok Terdikit']
                          .map((sort) => DropdownMenuItem(
                                value: sort,
                                child: Text(sort),
                              ))
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _filterSort = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // TextField Search Produk
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Cari Produk...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            SizedBox(height: 16),

            if (_filterKategori == 'Semua' || _filterKategori == 'Makanan') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Makanan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => _showAddItemDialog(context, 'Makanan'),
                  ),
                ],
              ),
              _buildItemList(makananList, 'Makanan'),
              Divider(),
            ],
            if (_filterKategori == 'Semua' || _filterKategori == 'Minuman') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Minuman', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => _showAddItemDialog(context, 'Minuman'),
                  ),
                ],
              ),
              _buildItemList(minumanList, 'Minuman'),
            ],
          ],
        ),
      ),
    );
  }
}