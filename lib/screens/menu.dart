import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/widgets/product_card.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String name = "Fanny Demarin"; 
  final String npm = "2506561542"; 
  final String classe = "KKI";
  final List<ItemHomepage> items = [
    ItemHomepage("See Products", Icons.newspaper),
    ItemHomepage("Add Product", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: 'French',
        style: TextStyle(
          color: Colors.blue, // bleu pour "French"
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      TextSpan(
        text: ' ',
      ),
      TextSpan(
        text: 'Football',
        style: TextStyle(
          color: Colors.white, // blanc pour "Football"
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      TextSpan(
        text: ' ',
      ),
      TextSpan(
        text: 'Shop',
        style: TextStyle(
          color: Colors.red, // rouge pour "Shop"
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
    ],
  ),
),
      ),
      drawer: LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: 'NPM', content: npm),
                  InfoCard(title: 'Name', content: name),
                  InfoCard(title: 'Class', content: classe),
                ],
              ),

              const SizedBox(height: 16.0),

              Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Welcome to French Football Shop',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    GridView.count(
                      primary: false,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: items.map((ItemHomepage item) {
                        return ItemCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],        
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}



