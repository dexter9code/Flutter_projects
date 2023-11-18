import 'package:places/models/place.dart';
import 'package:riverpod/riverpod.dart';

class LocationProviderNotifier extends StateNotifier<List<Place>> {
  LocationProviderNotifier() : super([]);

  void addLocation(Place location) {
    final isAlreadyExits = state.contains(location);
    state = [...state, location];
  }

  void removeLocation(Place location) {
    state = state.where((element) => element.id != location.id).toList();
  }
}

final locationProvider =
    StateNotifierProvider<LocationProviderNotifier, List<Place>>(
        (ref) => LocationProviderNotifier());
