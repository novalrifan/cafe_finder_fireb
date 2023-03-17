import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? id;
  final String? coffeeshopId;
  final String name;
  final String category;
  final String description;
  final String imageUrl;
  final double price;

  const Product({
    this.id,
    this.coffeeshopId,
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  Product copyWith({
    String? id,
    String? coffeeshopId,
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    double? price,
  }) {
    return Product(
      id: id ?? this.id,
      coffeeshopId: coffeeshopId ?? this.coffeeshopId,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'coffeeshopId': coffeeshopId,
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory Product.fromSnapshot(Map<String, dynamic> snap) {
    return Product(
      id: snap['id'].toString(),
      coffeeshopId: snap['coffeeshopId'],
      name: snap['name'],
      category: snap['category'],
      description: snap['description'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
    );
  }
  @override
  List<Object?> get props => [
        id,
        coffeeshopId,
        name,
        category,
        description,
        imageUrl,
        price,
      ];

  static List<Product> products = const [
    Product(
      id: '1',
      coffeeshopId: 'H5douQ6tsyqN09cJnkHu',
      name: 'Ice Cafe Latte',
      category: 'Espresso Based',
      description: 'Single shot Espresso with Fresh Milk',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/coffeeshopfinder-2298.appspot.com/o/back%2Fcafe.jpg?alt=media&token=6bcff270-8e1c-4148-a104-cdc514664a1a',
      price: 17.0,
    ),
    Product(
      id: '2',
      coffeeshopId: 'H5douQ6tsyqN09cJnkHu',
      name: 'Ice Cappuchino',
      category: 'Espresso Based',
      description: 'Double shot Espresso with Fresh Milk',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/coffeeshopfinder-2298.appspot.com/o/back%2Fcappu.jpg?alt=media&token=5c04ab7e-f5fb-4c5e-a07b-730f1e5220f5',
      price: 19.0,
    ),
    Product(
      id: '3',
      coffeeshopId: 'H5douQ6tsyqN09cJnkHu',
      name: 'Ice Hazelnut Latte',
      category: 'Mixed',
      description: 'Single shot Espresso with Fresh Milk plus Hazelnut Syrup',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/coffeeshopfinder-2298.appspot.com/o/back%2Fhazel.jpg?alt=media&token=ed78cf18-a3d1-4ac1-b460-4a350737ad26',
      price: 20.0,
    ),
    Product(
      id: '4',
      coffeeshopId: 'H5douQ6tsyqN09cJnkHu',
      name: 'V60/Japanese',
      category: 'Manual Brew',
      description: 'Manual brewwww',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/coffeeshopfinder-2298.appspot.com/o/back%2FManual%20Brew.jpg?alt=media&token=2a880a1e-9968-4a7a-8d03-bbd5d082712f',
      price: 22.0,
    ),
  ];
}
