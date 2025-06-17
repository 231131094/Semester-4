import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String brand;
  final String price;
  final bool isTransaction;
  final String? status;

  const ItemCard({
    super.key,
    required this.title,
    required this.brand,
    required this.price,
    this.isTransaction = false,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFD65C5C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTransaction ? _buildTransactionContent() : _buildWishlistContent(),
    );
  }

  Widget _buildWishlistContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(brand),
            Text(price),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text('Buy Now'),
        ),
      ],
    );
  }

  Widget _buildTransactionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(brand),
              ],
            ),
            Text(status ?? '', style: const TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 8),
        Text('Total 1 produk : $price', style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        Row(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
              ),
              child: const Text('Ajukan Pengembalian'),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
              ),
              child: const Text('Nilai'),
            ),
          ],
        ),
      ],
    );
  }
}
