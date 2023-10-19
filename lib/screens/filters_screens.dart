import 'package:flutter/material.dart';
import 'package:tourguide_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
  Function saveFilters;

  FiltersScreen({required this.saveFilters});
}

class _FiltersScreenState extends State<FiltersScreen> {
  var Summer = false;
  var Winter = false;
  var Family = false;

  Widget buildSwitchListTile(String title, String subtitle, var currentValue,
      void Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الفلترة'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  var selectedFilters = {
                    'summer': Summer,
                    'winter': Winter,
                    'family': Family,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile('الرحلات الصيفية',
                    'عدم اظهار الرحلات فى فصل الصيف فقط', Summer, (newValue) {
                  setState(() {
                    Summer = newValue;
                  });
                }),
                buildSwitchListTile('الرحلات الشتوية',
                    'اظهار الرحلات فى فصل الشتاء فقط', Winter, (newValue) {
                  setState(() {
                    Winter = newValue;
                  });
                }),
                buildSwitchListTile(
                    'الرحلات العائلية', 'اظهار الرحلات العائلية   فقط', Family,
                    (newValue) {
                  setState(() {
                    Family = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
