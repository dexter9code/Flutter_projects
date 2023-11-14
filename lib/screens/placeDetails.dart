import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/models/location.dart';
import 'package:places/provider/locationProvider.dart';

class PlaceDetailScreen extends ConsumerWidget {
  const PlaceDetailScreen({super.key, required this.selectedId});

  final String selectedId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Location selectedLocation = ref
        .read(locationProvider)
        .where((element) => element.id == selectedId)
        .first;

    return Scaffold(
      appBar: AppBar(
          title: Text(
        selectedLocation.place,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      )),
      body: Center(
        child: Text(
          selectedLocation.place,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
