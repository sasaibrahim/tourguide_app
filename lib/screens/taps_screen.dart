import 'package:flutter/material.dart';
import 'package:tourguide_app/models/trip.dart';
import 'package:tourguide_app/screens/category-screen.dart';
import 'package:tourguide_app/screens/favorite_screen.dart';
import 'package:tourguide_app/widgets/app_drawer.dart';

class TapsScreen extends StatefulWidget {
  static const screenRoute = '/';
  List<Trip> favouriteTrips;

  TapsScreen(this.favouriteTrips);

  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  void _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
      {'Screen': CategoriesScreen(), 'Title': 'تصنيفات الرحلات'},
      {
        'Screen': FavoriteScreen(widget.favouriteTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['Title'] as String),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex]["Screen"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
