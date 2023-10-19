import 'package:flutter/material.dart';
import 'package:tourguide_app/models/trip.dart';
import 'package:tourguide_app/widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Trip> favouriteTrips;

  FavoriteScreen(this.favouriteTrips);

  @override
  Widget build(BuildContext context) {
    if (favouriteTrips.isEmpty) {
      return Center(
        child: Text('هذه صفحة الرحلات المفضلة'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return TripItem(
            id: favouriteTrips[index].id,
            title: favouriteTrips[index].title,
            imageUrl: favouriteTrips[index].imageUrl,
            duration: favouriteTrips[index].duration,
            tripType: favouriteTrips[index].tripType,
            season: favouriteTrips[index].season,
            // removeItem:removeTrip,
          );
        },
        itemCount: favouriteTrips.length,
      );
    }
  }
}
