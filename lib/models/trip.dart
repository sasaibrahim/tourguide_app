enum Season {
  Winter,
  Spring,
  Summer,
  Autumn,
}

enum TripType {
  Exploration,
  Recovery,
  Activities,
  Therapy,
}

class Trip {
  String id;
  List<String> categories;
  String title;
  String imageUrl;
  List<String> activities;
  List<String> program;
  int duration;
  Season season;
  TripType tripType;
  bool isInSummer;
  bool isInWinter;
  bool isForFamilies;

  Trip(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.activities,
      required this.program,
      required this.duration,
      required this.season,
      required this.tripType,
      required this.isInSummer,
      required this.isInWinter,
      required this.isForFamilies});
}
