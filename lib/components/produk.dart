import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Produk extends StatefulWidget {
  const Produk({super.key});

  @override
  State<Produk> createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  Future<dynamic>getData()async{
    Dio dio = Dio();
    var response = await dio.get("https://6842f697e1347494c31e9e6f.mockapi.io/api/v1/listBarang");
    if(response.statusCode == 200){
      var data = response.data;
      return data;
    } else {
      print("gagal mengambil Data");
    }
    
  }
  @override
  void initState() {
  getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: FutureBuilder(future: getData(), 
            builder:(context , snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else{
                List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(snapshot.data);
                return CustomScrollView(
                  slivers: [
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.all(5),
                            color: Colors.grey,
                            child: Center(child: Text(data[index]["nama"])),
                          );
                        },
                        childCount: data.length,
                      ),
                    )
                  ],
                );
              }
            }),
          );
  }
}