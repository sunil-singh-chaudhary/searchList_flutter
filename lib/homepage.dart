import 'package:flutter/material.dart';

import 'resturant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Restaurant>? searchResult;
  String _selectedOption = 'name';
  TextEditingController searchController = TextEditingController();

  final ValueNotifier<String> _hintText =
      ValueNotifier<String>('Search by Name');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ValueListenableBuilder<String>(
              valueListenable: _hintText,
              builder: (context, value, child) => TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: _openDialog,
                    ),
                    hintText: value,
                    helperText: 'Search'),
                onChanged: (value) {
                  debugPrint(value);
                  if (_selectedOption == 'name') {
                    searchResult = restaurantList
                        .where((element) => element.name
                            .toLowerCase()
                            .toString()
                            .contains(value.toLowerCase()))
                        .toList();
                  }
                  if (_selectedOption == 'cusine') {
                    searchResult = restaurantList
                        .where((element) => element.cuisine
                            .toLowerCase()
                            .toString()
                            .startsWith(value.toLowerCase()))
                        .toList();
                  }
                  if (_selectedOption == 'rating') {
                    searchResult = restaurantList
                        .where((element) =>
                            element.rating.toString().contains(value))
                        .toList();
                  }
                  if (_selectedOption == 'price') {
                    searchResult = restaurantList
                        .where((element) =>
                            element.price.toString().contains(value))
                        .toList();
                  }

                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResult?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: searchResult != null
                        ? Text(searchResult![index].name)
                        : const Text(''),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _openDialog() {
    List<String> searchModes = ['name', 'cusine', 'rating', 'price'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Choose an Option'),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (String option in searchModes)
                    RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedOption,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                          _hintText.value = _getHintText(); // Update hint text
                        });
                        Navigator.pop(context);
                      },
                    ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  _getHintText() {
    switch (_selectedOption) {
      case 'name':
        return 'Search by Name';
      case 'cusine':
        return 'Search by Cuisine';
      case 'rating':
        return 'Search by Rating';
      case 'price':
        return 'Search by Price';
    }
  }
}
