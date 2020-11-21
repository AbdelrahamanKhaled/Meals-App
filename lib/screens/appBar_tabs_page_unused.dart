import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import 'categories_page.dart';
import 'favorites_tab_page.dart';

class TabsPage extends StatelessWidget {
  final List<Meal> _favorites;
  TabsPage(this._favorites);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bon Appetit',
          ),

          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.fastfood),
                text: 'Food Categories',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favourites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesPage(),
            FavoritesTabPage(_favorites),
          ],
        ),
      ),
    );
  }
}
