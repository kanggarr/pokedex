import 'package:flutter/material.dart';
import 'package:pokedex/core/provider/navigator_provider.dart';
import 'package:pokedex/home.dart';
import 'package:pokedex/pages/authentication/login.dart';
import 'package:pokedex/pages/first_page.dart';
import 'package:pokedex/pages/fourth_page.dart';
import 'package:pokedex/pages/second_page.dart';
import 'package:pokedex/pages/third_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/homePage': (context) => const HomePage(),
        '/firstPage': (context) => const FirstPage(),
        '/secondPage': (context) => const SecondPage(),
        '/thirdPage': (context) => const ThirdPage(),
        '/fourthPage': (context) => const FourthPage()
      },
    );
  }
}
