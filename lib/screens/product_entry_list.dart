import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/product_detail.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class productEntryListPage extends StatefulWidget {
  const productEntryListPage({super.key});

  @override
  State<productEntryListPage> createState() => _productEntryListPageState();
}

class _productEntryListPageState extends State<productEntryListPage> {
  String _currentFilter = "all"; 

  Future<List<ProductEntry>> fetchproduct(CookieRequest request, String filter) async {
    final response = await request.get('http://localhost:8000/json/filtered/?filter=$filter');

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listproduct = [];
    for (var d in data) {
      if (d != null) {
        listproduct.add(ProductEntry.fromJson(d));
      }
    }
    return listproduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final width = MediaQuery.of(context).size.width;

    // Déterminer le nombre de colonnes selon la largeur
    int crossAxisCount;
    double aspectRatio;
    if (width > 1200) {
      crossAxisCount = 3;
      aspectRatio = 0.80; // cartes plus compactes
    } else if (width > 700) {
      crossAxisCount = 2;
      aspectRatio = 0.8;
    } else {
      crossAxisCount = 1;
      aspectRatio = 0.90;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('French Football shop Products')),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // Barre de boutons de filtre
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _currentFilter = "all";
                      });
                    },
                    icon: const Icon(Icons.grid_view),
                    label: const Text("See All Products"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentFilter == "all" 
                        ? const Color(0xFF0D1B2A) 
                        : Colors.grey[300],
                      foregroundColor: _currentFilter == "all" 
                        ? Colors.white 
                        : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _currentFilter = "my";
                      });
                    },
                    icon: const Icon(Icons.person),
                    label: const Text("See My Products"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _currentFilter == "my" 
                        ? const Color(0xFF0D1B2A) 
                        : Colors.grey[300],
                      foregroundColor: _currentFilter == "my" 
                        ? Colors.white 
                        : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Liste des produits
          Expanded(
            child: FutureBuilder(
              key: ValueKey(_currentFilter),
              future: fetchproduct(request, _currentFilter), // ⚠️ Passe _currentFilter ici
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        Text(
                          'There are no football products yet.',
                          style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: aspectRatio,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: snapshot.data![index],
                        onTap: () {
                          // Navigate to product detail page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product: snapshot.data![index]),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}