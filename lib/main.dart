import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tourguide_app/app_data.dart';
import 'package:tourguide_app/screens/category_trips_screens.dart';
import 'package:tourguide_app/screens/filters_screens.dart';
import 'package:tourguide_app/screens/taps_screen.dart';
import 'package:tourguide_app/screens/trip_detail_screen.dart';

import 'models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> availableTrips = Trips_data;
  List<Trip> favouriteTrips = [];

  void changeFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableTrips = Trips_data.where((trip) {
        if (filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void manageFavorite(String tripId) {
    var existingIndex = favouriteTrips.indexWhere((trip) => trip.id == tripId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteTrips.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteTrips.add(Trips_data.firstWhere((trip) => trip.id == tripId));
      });
    }
  }

  bool isFavorite(String id) {
    return favouriteTrips.any((trip) => trip.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // English
        // Spanish
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.blue,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headlineSmall: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
                titleLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: const CategoriesScreen(),
      initialRoute: TapsScreen.screenRoute,
      routes: {
        TapsScreen.screenRoute: (ctx) => TapsScreen(favouriteTrips),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(availableTrips),
        TripDetailScreen.screenRoute: (ctx) =>
            TripDetailScreen(manageFavorite, isFavorite),
        FiltersScreen.screenRoute: (ctx) =>
            FiltersScreen(saveFilters: changeFilters),
      },
    );
  }
}
