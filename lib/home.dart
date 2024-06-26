import 'package:flutter/material.dart';
import 'package:pokedex/core/provider/navigator_provider.dart';
import 'package:pokedex/pages/first_page.dart';
import 'package:pokedex/pages/fourth_page.dart';
import 'package:pokedex/pages/second_page.dart';
import 'package:pokedex/pages/third_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
    const FourthPage()
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          navigationProvider.currentIndex = value;
        },
        currentIndex: navigationProvider.currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'third',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
      ),
      body: pages[navigationProvider.currentPage],
    );
  }
}
