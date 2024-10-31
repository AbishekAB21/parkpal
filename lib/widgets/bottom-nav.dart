import 'package:flutter/material.dart';
import 'package:parkpal/provider/bottom-nav-provider.dart';
import 'package:parkpal/screens/history-screen.dart';
import 'package:parkpal/screens/home-screen.dart';
import 'package:parkpal/screens/profile-screen.dart';
import 'package:parkpal/utils/app-colors.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final pages = [
    HomeScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Consumer<BottomNavProvider>(
          builder: (context, bottomNavProvider, child) {
            return BottomNavigationBar(
                onTap: (value) => bottomNavProvider.setIndex(value),
                backgroundColor: appcolor.backgroundColor,
                currentIndex: bottomNavProvider.currentIndex,
                selectedItemColor: appcolor.successColor,
                unselectedItemColor: appcolor.unselectedColor,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.history_rounded), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_rounded), label: "")
                ]);
          },
        ),
        body: Consumer<BottomNavProvider>(
          builder: (context, bottomNavProvider, child) {
            return pages[bottomNavProvider.currentIndex];
          },
        ),
      ),
    );
  }
}
