import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() {
    return _NewItemScreenState();
  }
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.spices];
  var _isLoading = false;

  void _onAddItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      final url = Uri.https(
          'flutter-test-f58c7-default-rtdb.asia-southeast1.firebasedatabase.app',
          'shopping-list.json');
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'name': _enteredName,
            'quantity': _enteredQuantity,
            'category': _selectedCategory?.title
          }));
      final Map<String, dynamic> resData = jsonDecode(response.body);
      if (!context.mounted) {
        // if screen is the same
        return;
      }
      // Navigator.of(context).pop();
      Navigator.of(context).pop(GroceryItem(
          id: resData['name'],
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text('Name')),
                  validator: (val) {
                    if (val == null ||
                        val.isEmpty ||
                        val.trim().length <= 1 ||
                        val.trim().length > 50) {
                      return 'Please Enter character between 1 to 50';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    _enteredName = newValue!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text('Quantity')),
                        initialValue: '1',
                        validator: (val) {
                          if (val == null ||
                              val.isEmpty ||
                              int.tryParse(val) == null ||
                              int.tryParse(val)! <= 0) {
                            return 'Please Enter valid Positive Number';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          _enteredQuantity = int.parse(newValue!);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: _selectedCategory,
                          items: [
                            for (final item in categories.entries)
                              DropdownMenuItem(
                                  value: item.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 15,
                                        color: item.value.color,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(item.value.title)
                                    ],
                                  ))
                          ],
                          onChanged: (vl) {
                            setState(() {
                              _selectedCategory = vl;
                            });
                          }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _isLoading
                            ? null
                            : () {
                                _formKey.currentState!.reset();
                              },
                        child: const Text('Cancel')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: _isLoading ? null : _onAddItem,
                        child: _isLoading
                            ? const SizedBox(
                                height: 12,
                                width: 12,
                                child: CircularProgressIndicator(),
                              )
                            : const Text('Save'))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
