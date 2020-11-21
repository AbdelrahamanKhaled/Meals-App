import 'package:flutter/material.dart';
import 'screens/favorites_drawer_page.dart';
import 'dummy_data_base.dart';
import 'models/meal.dart';
import 'screens/bottom_tabBar_page.dart';
import 'screens/filters_page.dart';
import 'screens/single_category_page.dart';
import 'screens/single_meal_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Map< String , bool> _filters = {
    'gluten': false,
    'lactose': false ,
    'vegan' : false ,
    'Vegetarian' : false ,
  };
  List<Meal> _availableMeals = MEALS;
  List<Meal> _favoriteMeals=[];
  void _setFilters(Map<String , bool> chosenFilters ){
    setState(() {
      _filters=chosenFilters;
      _availableMeals = MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree)
          return false;
        if(_filters['lactose'] && !meal.isLactoseFree)
        return false ;
        if(_filters['vegan'] && !meal.isVegan)
          return false ;
        if(_filters['Vegetarian'] && !meal.isVegetarian)
          return false ;
        return true;
      }).toList();
    });
  }
bool _isFavorite(Meal selectedMeal)
{
  return _favoriteMeals.contains(selectedMeal);
}
void _addAndDeleteFromFavorites(Meal selectedMeal){
    setState(() {
      if(!_isFavorite(selectedMeal))
      _favoriteMeals.add(selectedMeal);
      else {
        _favoriteMeals.remove(selectedMeal);
      }
    });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),),
      ),
      home: BottomTabBarPage(_favoriteMeals),
      //initialRoute: '@', the default is /
      routes: {
        //'/' : (ctx)=> HomePage(),
        'Home-singleCategory': (ctx) => SingleCategoryPage(_availableMeals),
        'singleCategory-singleMeal': (ctx)=> SingleMealPage(_isFavorite, _addAndDeleteFromFavorites),
        'drawer-filters' : (ctx) => FiltersPage(_filters, _setFilters),
        'drawer-favorites': (ctx) => FavoritesDrawerPage(_favoriteMeals),
      },
    );
  }


}
