import 'package:e_commerce/view/account.dart';
import 'package:e_commerce/model/produkModel.dart';
import 'package:e_commerce/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/view/grafik.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/controller/user_provider.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/RegistPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(ProdukAdapter());
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
      },
    );
  }
}