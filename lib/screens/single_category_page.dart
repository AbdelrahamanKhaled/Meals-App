import 'package:flutter/material.dart';
import 'package:meals_app/rest_of_widgets/action_on_empty_page.dart';
import '../models/meal.dart';
import '../rest_of_widgets/meal_item.dart';

class SingleCategoryPage extends StatelessWidget {
  final List<Meal> availableMeals;

  SingleCategoryPage(this.availableMeals);

  @override
  Widget build(BuildContext context) {
    final _routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String _categoryId = _routArgs['id'];
    final String _categoryName = _routArgs['name'];
    final _displayedMeals = availableMeals.where((meal) {
      return meal.categories.contains(_categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryName),
      ),
      body: _displayedMeals.isEmpty
          ? EmptyPage('No available Meals on this filter')
          : ListView.builder(
              itemCount: _displayedMeals.length,
              itemBuilder: (context, index) {
                return MealItem(
                  id: _displayedMeals[index].id,
                  name: _displayedMeals[index].name,
                  imageUrl: _displayedMeals[index].imageUrl,
                  duration: _displayedMeals[index].duration,
                  affordability: _displayedMeals[index].affordability,
                  complexity: _displayedMeals[index].complexity,
                );
              }),
    );
  }
}
