import 'package:e_commerce/Pages/forYou.dart';
import 'package:flutter/material.dart';
import "./widgets/customAppBar.dart";
import './widgets/BottomNavBar.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      
      //body 
      body: Column(
        children: [
          const CustomSearchAppBar(),
          Expanded(
            child: Foryou()
          )
        ],
      ),

      //nav bawah
      bottomNavigationBar: Bottomnavbar(),

      // bottomNavigationBar: BottomAppBar(
      //   height: 100,
      //   // shape: CircularNotchedRectangle(),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Column(
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: Icon(Icons.thumb_up_alt_rounded),
      //           ),
      //           Text("For You", style: TextStyle(color: Colors.black)),
      //         ],
      //       ),
      //       // SizedBox(width: 30,),
      //       Column(
      //         children: [
      //           Column(
      //             children: [
      //               IconButton(
      //                 onPressed: () {},
      //                 icon: Icon(Icons.shopping_bag_rounded),
      //               ),
      //               Text("Bag", style: TextStyle(color: Colors.black)),
      //             ],
      //           ),
      //         ],
      //       ),
      //       // SizedBox(width: 15,),
      //       Column(
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: Icon(Icons.list_alt_rounded),
      //           ),
      //           Text("Transaction", style: TextStyle(color: Colors.black)),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //             onPressed: () {},
      //             icon: Icon(Icons.account_circle_rounded),
      //           ),
      //           Text("Account", style: TextStyle(color: Colors.black)),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton.large(
      //   shape: CircleBorder(),
      //   onPressed: () {},
      //   child: Icon(Icons.shopping_bag_rounded),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}