import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id ;
  final String name;
  final Color color;

  CategoryItem(this.id , this.name, this.color);

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      'Home-singleCategory',
        arguments: {'id' : id , 'name': name ,}
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
