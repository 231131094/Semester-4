import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/produkModel.dart'; 
import '../widgets/produkCard.dart'; 

class Foryou extends StatefulWidget {
  const Foryou({super.key});

  @override
  State<Foryou> createState() => _ForyouState();
}

class _ForyouState extends State<Foryou> {
  Dio dio = Dio();

  // Mendapatkan data dari API
  Future<List<Produk>> getData() async {
    var response = await dio.get(
      "https://6842f697e1347494c31e9e6f.mockapi.io/api/v1/listBarang",
    );
    if (response.statusCode == 200) {
      //Ubah list dynamic ke List<Produk> menggunakan fromJson
      List data = response.data;
      return data.map((json) => Produk.fromJson(json)).toList();
    } else {
      print("Gagal mengambil data");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Produk>>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Terjadi kesalahan"));
                } else {
                  List<Produk> data = snapshot.data ?? [];

                  return CustomScrollView(
                    slivers: [
                      // Section: Special Offers
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Special Offers",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "See More",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Section: Gambar
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Image.asset("assets/image 2.png", fit: BoxFit.fitWidth),
                          ],
                        ),
                      ),

                      // Section: Popular
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: const Text(
                            "Popular",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      // Section: Grid produk
                      SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.75,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return ProductCard(produk: data[index]);
                          },
                          childCount: data.length,
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
