import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final name;
  final id;
  final imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    this.id,
    this.name,
    this.affordability,
    this.complexity,
    this.duration,
    this.imageUrl,
  });

  void _selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      'singleCategory-singleMeal',
      arguments: id,
    );
  }

  String get _affordabilityStr {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  String get _complexityStr {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Complex:
        return ' Complex';
      default:
        return 'Unknown';
    }
  }

  Widget _rawBuilder(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5,),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(20),
        elevation: 5,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black26,
                    ),
                    width: 280,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _rawBuilder(Icons.timer , '${duration} min'),
                  _rawBuilder(Icons.work ,_complexityStr ),
                  _rawBuilder(Icons.attach_money , _affordabilityStr),
                  ]
                  ),
              ),
          ],
        ),
      ),
    );
  }
}
