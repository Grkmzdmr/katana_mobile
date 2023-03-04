import 'package:flutter/material.dart';
import 'package:katana_mobile/core/constants/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
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
    );
  }
}
