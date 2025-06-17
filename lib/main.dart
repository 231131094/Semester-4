import 'package:e_commerce/account.dart';
import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/grafik.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/user_provider.dart';
import 'package:e_commerce/user_model.dart';
import 'package:e_commerce/RegistPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: const MyApp(),
      ),
    );
  } catch (e) {
    print('Failed to initialize Hive: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Registpage(),
        '/profile':
            (context) =>
                const ProfileInfoScreen(), 
        '/grafik': (context) => const GrafikScreen(),// atau ProfileInfoScreen kalau kamu rename
      },
    );
  }
}