import 'package:flutter/material.dart';
import '../rest_of_widgets/action_on_empty_page.dart';
import '../rest_of_widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesTabPage extends StatelessWidget {
  final List<Meal> _favorites;

  FavoritesTabPage(this._favorites);

  @override
  Widget build(BuildContext context) {
    return _favorites.isEmpty
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
            });
  }
}
