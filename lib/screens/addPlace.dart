import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places/models/place.dart';
import 'package:places/provider/locationProvider.dart';
import 'package:places/widgets/imagePicker.dart';
import 'package:places/widgets/locationPicker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _selectedLocation;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _onAddPlaceHandler() async {
    ScaffoldMessenger.of(context).clearSnackBars();
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _selectedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please Add Location & Image')));
      return;
    }
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(_pickedImage!.path);
    final copiedImage = await _pickedImage!.copy('${appDir.path}/$fileName');

    ref.watch(locationProvider.notifier).addLocation(
          Place(
              id: DateTime.now().toString(),
              place: _titleController.text,
              image: copiedImage,
              location: _selectedLocation!),
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Add new Place',
        style: Theme.of(context).textTheme.titleMedium,
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                maxLength: 30,
                controller: _titleController,
                keyboardType: TextInputType.streetAddress,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                decoration: InputDecoration(
                    label: Text(
                  'Title',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )),
              ),
              const SizedBox(
                height: 30,
              ),
              ImageInput(
                onPickImage: (image) {
                  _pickedImage = image;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              LocationInput(
                onSelectLocation: (location) {
                  _selectedLocation = location;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('add Place'),
                onPressed: _onAddPlaceHandler,
              )
            ],
          ),
        ),
      ),
    );
  }
}
