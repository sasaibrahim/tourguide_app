import 'package:flutter/material.dart';
import 'package:tourguide_app/screens/filters_screens.dart';
import 'package:tourguide_app/screens/taps_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      String title, IconData icon, void Function()? onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'ElMessiri', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 40),
            color: Colors.amber,
            child: Text(
              'دليلك السياجي',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('الرحلات ', Icons.card_travel, () {
            Navigator.of(context).pushNamed(TapsScreen.screenRoute);
          }),
          buildListTile('الفلترة ', Icons.filter_list, () {
            Navigator.of(context).pushNamed(FiltersScreen.screenRoute);
          }),
        ],
      ),
    );
  }
}
