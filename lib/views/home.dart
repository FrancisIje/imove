import 'package:flutter/material.dart';
import 'package:imove/view_models/history_viewmodel.dart';
import 'package:imove/view_models/home_viewmodel.dart';
import 'package:imove/view_models/user_viewmodel.dart';
import 'package:imove/views/history_screen.dart';
import 'package:imove/views/home_screen.dart';
import 'package:imove/views/profile_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<UserViewmodel>(context, listen: false).setUser();
    Provider.of<HistoryViewmodel>(context, listen: false).getDeliveries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];
    return Consumer<HomeViewmodel>(builder: (context, value, child) {
      return Scaffold(
        body: screens[value.currentIndex],
        bottomNavigationBar:
            BottomNavigationBar(currentIndex: value.currentIndex, items: [
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  value.setIndex(0);
                },
                child: const ImageIcon(
                  AssetImage("assets/icons/home.png"),
                ),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  value.setIndex(1);
                },
                child: const ImageIcon(
                  AssetImage("assets/icons/calender.png"),
                ),
              ),
              label: "History"),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  value.setIndex(2);
                },
                child: const ImageIcon(
                  AssetImage("assets/icons/person.png"),
                ),
              ),
              label: "Profile"),
        ]),
      );
    });
  }
}
