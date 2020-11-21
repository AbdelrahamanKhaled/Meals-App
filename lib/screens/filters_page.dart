import 'package:flutter/material.dart';
import '../rest_of_widgets/my_drawer.dart';

class FiltersPage extends StatefulWidget {
  final Function _saveFilters;
  final Map<String, bool> _currentFilters;

  FiltersPage(this._currentFilters, this._saveFilters);

  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FiltersPage> {
  var isGlutenFree = false;
  var isLactoseFree = false;
  var isVegan = false;
  var isVegetarian = false;

  @override
  initState() {
    isGlutenFree = widget._currentFilters['gluten'];
    isLactoseFree = widget._currentFilters['lactose'];
    isVegan = widget._currentFilters['vegan'];
    isVegetarian = widget._currentFilters['Vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildSwitchListTile(
        String title, String description, bool value, Function currentValue) {
      return Expanded(
        child: SwitchListTile(
          title: Text(title),
          subtitle: Text(description),
          value: value,
          onChanged: currentValue,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Chose Your Filters for Meals',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildSwitchListTile(
              'Gluten Free', 'Your Food will be without Gluten', isGlutenFree,
              (value) {
            setState(() {
              isGlutenFree = value;
            });
          }),
          buildSwitchListTile('Lactose Free',
              'Your meals will be without Lactose', isLactoseFree, (value) {
            setState(() {
              isLactoseFree = value;
            });
          }),
          buildSwitchListTile('Vegan', 'Your meals will be Vegan only', isVegan,
              (value) {
            setState(() {
              isVegan = value;
            });
          }),
          buildSwitchListTile(
              'Vegetarian', 'Your meals will be Vegetarian only', isVegetarian,
              (value) {
            setState(() {
              isVegetarian = value;
            });
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            final _chosenFilters = {
              'gluten': isGlutenFree,
              'lactose': isLactoseFree,
              'vegan': isVegan,
              'Vegetarian': isVegetarian,
            };
            widget._saveFilters(_chosenFilters);
          },
        ),
    );
  }
}
