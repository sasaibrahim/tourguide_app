import 'package:flutter/material.dart';
import 'package:tourguide_app/screens/category_trips_screens.dart';

class CategoryItem extends StatelessWidget {
  String id;
  String title;
  String imageUrl;

  CategoryItem(this.id, this.title, this.imageUrl);

  void selectionCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.screenRoute, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectionCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
}
