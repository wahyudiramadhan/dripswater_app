import 'package:dripswater/const/app_color.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatelessWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Chart",
          style: TextStyle(color: ColorApp.blueAppBarColor),
        ),
        actions: const [
          BackButton(
            color: ColorApp.blueAppBarColor,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
