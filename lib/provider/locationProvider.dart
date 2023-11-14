import 'package:places/models/location.dart';
import 'package:riverpod/riverpod.dart';

class LocationProviderNotifier extends StateNotifier<List<Location>> {
  LocationProviderNotifier() : super([]);

  void addLocation(Location location) {
    final isAlreadyExits = state.contains(location);
    state = [...state, location];
  }

  void removeLocation(Location location) {
    state = state.where((element) => element.id != location.id).toList();
  }
}

final locationProvider =
    StateNotifierProvider<LocationProviderNotifier, List<Location>>(
        (ref) => LocationProviderNotifier());
