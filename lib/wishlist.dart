import 'package:flutter/material.dart';
import 'package:e_commerce/itemCard.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Wishlist'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: const [
          ItemCard(title: 'Cap', brand: 'Miniso', price: 'IDR 80.000'),
          ItemCard(title: 'Smartwatch', brand: 'Huawei', price: 'IDR 1.000.000'),
        ],
      ),
    );
  }
}
