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
          ],
        );
      },
    );
  }

  Widget _buildItemList(List<Map<String, dynamic>> list, String jenis) {
    return Column(
      children: List.generate(list.length, (index) {
        return ListTile(
          title: Text(list[index]['nama'], style: TextStyle(fontSize: 14)),
          subtitle: Text('Stok: ${list[index]['stok']}'),
          trailing: TextButton(
            onPressed: () => _showEditItemDialog(context, jenis, index),
            child: Text('Edit Produk', style: TextStyle(fontSize: 18, color: Colors.blue)),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: isDesktop
            ? Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Makanan', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => _showAddItemDialog(context, 'Makanan'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        _buildItemList(makananList, 'Makanan'),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Minuman', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => _showAddItemDialog(context, 'Minuman'),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        _buildItemList(minumanList, 'Minuman'),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                  Row(
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
              ),
      ),
    );
  }
}
