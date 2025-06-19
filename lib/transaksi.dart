import 'package:flutter/material.dart';
import 'package:e_commerce/itemCard.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Transaksi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: const [
          ItemCard(
            title: 'Cap',
            brand: 'Miniso',
            price: 'Rp 2.000.000',
            isTransaction: true,
            status: 'Selesai',
          ),
          ItemCard(
            title: 'TV',
            brand: 'LG',
            price: 'Rp 10.000.000',
            isTransaction: true,
            status: 'Selesai',
          ),
        ],
      ),
    );
  }
}
