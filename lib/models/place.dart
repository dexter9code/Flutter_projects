import 'dart:io';

class PlaceLocation {
  const PlaceLocation(
      {required this.address, required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;
  final String address;
}

class Place {
  const Place(
      {required this.id,
      required this.place,
      required this.image,
      required this.location});

  final String id;
  final String place;
  final File image;
  final PlaceLocation location;
}
