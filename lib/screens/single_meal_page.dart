import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../dummy_data_base.dart';

class SingleMealPage extends StatelessWidget {
  final Function _addAndDeleteFromFavorites;
  final Function _isFavorite;

  SingleMealPage(this._isFavorite, this._addAndDeleteFromFavorites);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments;
    final String _mealId = routeArgs;
    final _selectedMeal = MEALS.firstWhere((meal) => meal.id == _mealId);

    Widget _buildLabelSection(String label) {
      return Container(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
      );
    }

    Widget _buildListSection(List<String> list, bool isStepsList) {
      int stepIndex = 1;
      return Container(
        width: 380,
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list.map((item) {
            return isStepsList
                ? ListTile(
                    leading: CircleAvatar(
                      child: Text('${stepIndex++}'),
                    ),
                    title: Column(
                      children: [
                        Text(
                          item,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: 380,
                    child: Card(
                      margin: EdgeInsets.only(bottom: 10),
                      elevation: 5,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      color: Theme.of(context).primaryColorLight,
                    ),
                  );
          }).toList(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedMeal.name,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500),
                  bottomRight: Radius.circular(500),
                ),
                child: Image.network(
                  _selectedMeal.imageUrl,
                  fit: BoxFit.fitWidth,
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),
            _buildLabelSection('Ingredients'),
            _buildListSection(_selectedMeal.ingredients, false),
            _buildLabelSection('Steps'),
            _buildListSection(_selectedMeal.steps, true),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: _isFavorite(_selectedMeal)
            ? Icon(Icons.star)
            : Icon(Icons.star_border),
        onPressed: () {
          _addAndDeleteFromFavorites(_selectedMeal);
        },
      ),
    );
  }
}
