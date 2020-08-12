import 'package:ecommerce_app/screens/categories_screen.dart';
import 'package:ecommerce_app/screens/favorite_screen.dart';
import 'package:ecommerce_app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': "Category"},
    {'page': FavoriteScreen(), 'title': "Favorite"}
  ];

  int _selectedPageIndex = 0;

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("Category")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("Favorite"))
        ],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
