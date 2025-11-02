import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
        title: const Text(
          'Football Shop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () =>
                  _showSnackBar(context, "You have pressed the All Products button"),
              icon: const Icon(Icons.list),
              label: const Text("All Products"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () =>
                  _showSnackBar(context, "You have pressed the My Products button"),
              icon: const Icon(Icons.shopping_bag),
              label: const Text("My Products"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () =>
                  _showSnackBar(context, "You have pressed the Create Product button"),
              icon: const Icon(Icons.add),
              label: const Text("Create Product"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
