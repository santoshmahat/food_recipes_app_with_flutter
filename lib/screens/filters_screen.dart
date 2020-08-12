import 'package:ecommerce_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static final routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
    );
  }
}
