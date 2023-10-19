import 'package:flutter/material.dart';
import 'package:tourguide_app/widgets/trip_item.dart';

import '../models/trip.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/category_trips';
  List<Trip> availableTrips;

  CategoryTripsScreen(this.availableTrips);

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    var categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title']!;
    displayTrips = widget.availableTrips.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

// String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            // removeItem:removeTrip,
          );
        },
        itemCount: displayTrips.length,
      ),
    );
  }
}
