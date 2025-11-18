// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    String description;
    Category category;
    String? thumbnail;
    int itemViews;
    bool isFeatured;
    int releaseYear;
    int price;
    String brand;
    int? userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.itemViews,
        required this.isFeatured,
        required this.releaseYear,
        required this.price,
        required this.brand,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: categoryValues.map[json["category"]]!,
        thumbnail: json["thumbnail"],
        itemViews: json["item_views"],
        isFeatured: json["is_featured"],
        releaseYear: json["release_year"],
        price: json["price"],
        brand: json["brand"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": categoryValues.reverse[category],
        "thumbnail": thumbnail,
        "item_views": itemViews,
        "is_featured": isFeatured,
        "release_year": releaseYear,
        "price": price,
        "brand": brand,
        "user_id": userId,
    };
}

enum Category {
    BALL,
    SCARF,
    T_SHIRT
}

final categoryValues = EnumValues({
    "ball": Category.BALL,
    "scarf": Category.SCARF,
    "t-shirt": Category.T_SHIRT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
