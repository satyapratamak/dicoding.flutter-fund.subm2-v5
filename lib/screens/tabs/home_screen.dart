import 'package:flutter/material.dart';
import 'package:restaurant_search_v5/widget/list_restaurant_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListRestaurantWidget(),
      ],
    );
  }
}
