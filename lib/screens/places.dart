import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/provider/locationProvider.dart';
import 'package:places/screens/addPlace.dart';
import 'package:places/screens/placeDetails.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadedItems = ref.watch(locationProvider);
    Widget content = Center(
      child: Text(
        'No Places Yet! Try Add Some',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );

    if (ref.read(locationProvider).isNotEmpty) {
      content = ListView.builder(
          itemCount: loadedItems.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.6),
              ),
              onDismissed: (direction) {
                ref
                    .watch(locationProvider.notifier)
                    .removeLocation(loadedItems[index]);
              },
              key: ValueKey(loadedItems[index].id),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => PlaceDetailScreen(
                          selectedId: loadedItems[index].id)));
                },
                title: Text(
                  loadedItems[index].place,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Places',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const AddPlaceScreen()));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: content);
  }
}
