import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../rest_of_widgets/my_drawer.dart';
import '../screens/categories_page.dart';
import '../screens/favorites_tab_page.dart';

class BottomTabBarPage extends StatefulWidget {
  final List<Meal> _favorites;

  BottomTabBarPage(this._favorites);

  @override
  BottomTabBarPageState createState() => BottomTabBarPageState();
}

class BottomTabBarPageState extends State<BottomTabBarPage> {
  List<Map<String, Object>> _pages ;

  @override
  void initState(){
      _pages = [
      {
        'page': CategoriesPage(),
        'pageName': 'All Categories',
      },
      {
        'page': FavoritesTabPage(widget._favorites),
        'pageName': 'Your Favorites',
      }
    ];
    super.initState();
  }
  int _currentIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_currentIndex]['pageName'],
        ),
      ),
      drawer: MyDrawer(),
      body: _pages[_currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text(
              'All Categories',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              'Favorites',
            ),
          ),
        ],
      ),
    );
  }
}
