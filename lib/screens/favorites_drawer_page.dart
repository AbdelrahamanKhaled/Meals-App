import 'package:flutter/material.dart';
import '../rest_of_widgets/action_on_empty_page.dart';
import 'package:meals_app/rest_of_widgets/my_drawer.dart';
import '../rest_of_widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesDrawerPage extends StatelessWidget {
  final List<Meal> _favorites;

  FavoritesDrawerPage(this._favorites);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
      ),
      drawer: MyDrawer(),
      body: _favorites.isEmpty
          ? EmptyPage('You don\'t have favorite meals yet... Let\'s add some')
          : ListView.builder(
              itemCount: _favorites.length,
              itemBuilder: (context, index) {
                return MealItem(
                  id: _favorites[index].id,
                  name: _favorites[index].name,
                  imageUrl: _favorites[index].imageUrl,
                  duration: _favorites[index].duration,
                  affordability: _favorites[index].affordability,
                  complexity: _favorites[index].complexity,
                );
              }),
    );
  }
}
