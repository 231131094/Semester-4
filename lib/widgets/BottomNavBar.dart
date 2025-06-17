import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      );
  }
}