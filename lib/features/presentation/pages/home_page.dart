import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:katana_mobile/core/constants/palette.dart';
import 'package:katana_mobile/features/presentation/components/main_menu_widget.dart';
import 'package:sizer/sizer.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return MainMenuWidget();
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
              color: Palette.primary,
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: InkWell(onTap: () {}, child: Icon(Icons.home)),
              ),
              SizedBox(
                height: 36,
                width: 36,
                child: InkWell(onTap: () {}, child: Icon(Icons.done_outline)),
              ),
              SizedBox(
                height: 36,
                width: 36,
                child: InkWell(
                    onTap: () {}, child: Icon(Icons.notifications_outlined)),
              ),
              SizedBox(
                height: 36,
                width: 36,
                child: InkWell(
                    onTap: () {}, child: Icon(Icons.account_circle_outlined)),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   currentIndex: _selectedTab,
      //   onTap: (index) => _changeTab(index),
      //   selectedItemColor: Palette.white,
      //   unselectedItemColor: Palette.black,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home_outlined), label: "Anasayfa"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.done_outline), label: "Görevlerim"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.notifications_outlined), label: "Bildirimler"),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_outlined), label: "Hesap"),
      //   ],
      // ),
    );
  }
}
