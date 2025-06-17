import 'package:e_commerce/Pages/forYou.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import "./widgets/customAppBar.dart";

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
      // appBar: AppBar(
      //   backgroundColor: Color(0xff75C2F6),
      //   toolbarHeight: 150,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(40))),
      //   centerTitle:true,
      //   title: Text("sBN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
      //   actions: [
      //     IconButton(
      //       color: Colors.white,
      //       iconSize: 35,
      //       onPressed: (){}, 
      //       icon: Icon(Icons.notifications_rounded)
      //     )
      //   ],
        
      // ),
      
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
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            activeColor: Colors.white,
            tabs:[
            GButton(icon: Icons.thumb_up_alt_rounded,text: "For You",),
            GButton(icon: Icons.shopping_bag_rounded,text: "Bag",),
            GButton(icon: Icons.list_alt_rounded, text: "Transaction",),
            GButton(icon: Icons.account_circle_rounded, text: "User",),
          ]),
        ),
      ),

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