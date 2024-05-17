import 'package:flutter/material.dart';
 //* This file contains the filter screen 
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterset = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Favourites"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _gluttenFreeFilterset,
            onChanged: (ischecked) {},
            title: Text(
              "'Gluten Free",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: const Text("Only includes Gluten-Free Meals "),
            activeColor: Theme.of(context).colorScheme.tertiary,
          )
        ],
      ),
    );
  }
}
