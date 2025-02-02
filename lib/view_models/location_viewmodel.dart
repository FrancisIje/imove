import 'package:flutter/material.dart';
import 'package:imove/models/latlong.dart';

class LocationViewmodel extends ChangeNotifier {
  LatLong? _location;

  LatLong get location => _location ?? LatLong(lat: 0, long: 0);

  setLocation(LatLong newLocation) {
    _location = newLocation;
    notifyListeners();
  }
}
