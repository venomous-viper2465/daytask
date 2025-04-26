import 'package:daytask/mainscreen.dart';
import 'package:daytask/widgets/bottomnavigation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        MainScreen(),
        MainScreen(),
      ][currentPageIndex],
      bottomNavigationBar: BottomNavigation(
        selectedPageIndex: currentPageIndex,
        onPress: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
      ),
    );
  }
}
