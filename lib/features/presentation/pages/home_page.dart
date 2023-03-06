import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:katana_mobile/core/constants/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  final tokenBox = Hive.box("tokenBox");

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(tokenBox.get("token"),)
      ),
      backgroundColor: Palette.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Palette.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: height / 3,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Palette.white,
        unselectedItemColor: Palette.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Anasayfa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outline), label: "Görevlerim"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: "Bildirimler"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Hesap"),
        ],
      ),
    );
  }
}
