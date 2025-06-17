import 'package:flutter/material.dart';
import 'package:e_commerce/user_provider.dart';
import 'package:e_commerce/profile.dart';
import 'package:e_commerce/grafik.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    final user = userProvider.user;
    
    // Debug print to check the current user
    debugPrint('Current user in AccountScreen: ${user.toString()}');

    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: kToolbarHeight),

            // User info section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          user.profilePicture != null &&
                                  user.profilePicture!.isNotEmpty
                              ? NetworkImage(user.profilePicture!)
                              : const AssetImage('assets/hulk.jpg')
                                  as ImageProvider,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.username.isNotEmpty ? user.username : "Guest",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.wallet, color: Colors.deepPurple),
                            const SizedBox(width: 4),
                            Text(
                              'Rp ${user.balance.toString()}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Menu items
            _buildMenuItem(context, Icons.person, 'Profil', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileInfoScreen(),
                ),
              );
            }),
            _buildMenuItem(context, Icons.receipt, 'Daftar Transaksi'),
            _buildMenuItem(context, Icons.favorite, 'Wishlist'),
            _buildMenuItem(context, Icons.bar_chart, 'Grafik', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GrafikScreen(),
                ),
              );
            }),
            _buildMenuItem(context, Icons.payment, 'Metode Pembayaran'),
            _buildMenuItem(context, Icons.local_offer, 'Voucher & Promo'),
            _buildMenuItem(context, Icons.card_giftcard, 'Point Reward'),
            _buildMenuItem(context, Icons.help, 'Bantuan & Dukungan'),
            _buildMenuItem(context, Icons.security, 'Pusat Keamanan'),
            _buildMenuItem(context, Icons.language, 'Bahasa & Tampilan'),
            _buildMenuItem(context, Icons.info, 'Tentang Aplikasi'),
            _buildMenuItem(context, Icons.logout, 'Log out', () {
              userProvider.logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', 
                (Route<dynamic> route) => false
              );
            }),

            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'For You'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Bag'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: 3,
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    IconData icon,
    String title, [
    VoidCallback? onTap,
  ]) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFEAEBD0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(title, style: const TextStyle(color: Colors.black)),
        trailing: const Icon(Icons.chevron_right, color: Colors.black),
        onTap: onTap,
      ),
    );
  }
}