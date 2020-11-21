import 'package:flutter/material.dart';
import '../rest_of_widgets/category_item.dart';
import '../dummy_data_base.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: CATEGORIES
            .map((item) => CategoryItem(item.id, item.name, item.color),).toList(),
    );
  }
}
