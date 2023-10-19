import 'package:flutter/material.dart';
import 'package:tourguide_app/widgets/category_item.dart';

import '../app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: Categories_data.map((categoryData) => CategoryItem(
          categoryData.id, categoryData.title, categoryData.imageUrl)).toList(),
    );
  }
}
