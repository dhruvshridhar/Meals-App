import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Settings"),
      ),
      appBar: AppBar(
        title: Text("Settings"),
      ),
      drawer: MainDrawer(),
    );
  }
}
