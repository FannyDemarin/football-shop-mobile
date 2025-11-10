import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:flutter/services.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";
  String _category = "t-shirt"; // default
  String _thumbnail = "";
  bool _isFeatured = false; // default
  double _price = 0;
  String _brand = "";
  int _releaseYear = 2024;

  final List<String> _categories = [
    't-shirt',
    'ball',
    'scarf',
    'tracksuit',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Product Form')),
        backgroundColor: Color(0xFF0D1B2A),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Product Name ===
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Product Name",
                  labelText: "Product Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                maxLength: 50,
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty!";
                  }
                  if (value.length < 3) {
                    return "Name must be at least 3 characters long!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // === Description ===
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Product Description",
                  labelText: "Product Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                maxLength: 300,
                onChanged: (value) => setState(() => _description = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty!";
                  }
                  if (value.length < 10) {
                    return "Description must be at least 10 characters!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // === Price ===
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                ],
                decoration: InputDecoration(
                  hintText: "Product Price",
                  labelText: "Price (\IDR)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _price = double.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Price cannot be empty!";
                  }
                  final price = double.tryParse(value);
                  if (price == null) {
                    return "Price must be a valid number!";
                  }
                  if (price <= 0) {
                    return "Price must be greater than 0!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // === Brand ===
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Brand",
                  labelText: "Brand",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                maxLength: 50,
                onChanged: (value) => setState(() => _brand = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Brand cannot be empty!";
                  }
                  if (value.length < 2) {
                    return "Brand name too short!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // === Release Year ===
              TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // autorise uniquement les chiffres
                  LengthLimitingTextInputFormatter(4),    // limite à 4 caractères max
                ],
                decoration: InputDecoration(
                  hintText: "Release Year (e.g. 2024)",
                  labelText: "Release Year",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _releaseYear = int.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Release year cannot be empty!";
                  }
                  final year = int.tryParse(value);
                  if (year == null) {
                    return "Release year must be a number!";
                  }
                  if (year < 1900 || year > DateTime.now().year + 1) {
                    return "Enter a valid release year!";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // === Category ===
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                value: _category,
                items: _categories
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat[0].toUpperCase() + cat.substring(1)),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) => setState(() => _category = newValue!),
              ),
              const SizedBox(height: 10),

              // === Thumbnail URL ===
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Thumbnail URL (optional)",
                  labelText: "Thumbnail URL",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) => setState(() => _thumbnail = value),
              ),
              const SizedBox(height: 10),

              // === Is Featured ===
              SwitchListTile(
                title: const Text("Mark as Featured Product"),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value),
              ),
              const SizedBox(height: 10),

              // === Save Button ===
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF0D1B2A)),
                  ),
                  onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Product saved successfully!'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: $_name'),
                Text('Description: $_description'),
                Text('Price: IDR ${_price.toStringAsFixed(2)}'),
                Text('Brand: $_brand'),
                Text('Release Year: $_releaseYear'),
                Text('Category: $_category'),
                Text('Thumbnail: $_thumbnail'),
                Text('Featured: ${_isFeatured ? "Yes" : "No"}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                      // reset après avoir fermé le popup
                      _formKey.currentState!.reset();
                      _name = "";
                      _description = "";
                      _price = 0;
                      _brand = "";
                      _releaseYear = 2024;
                      _category = "t-shirt";
                      _thumbnail = "";
                      _isFeatured = false;
                      });
                    },
                  ),
                ],
              );
            },
          );
        }
      },

                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
