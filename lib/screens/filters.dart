import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

 //* This file contains the filter screen 
 
class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});
  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _gluttenFreeFilterset = false;  //? tHIS Value will store the default value of the Toggle Button as false 
  var _lactoseFreeFilterset=false; 
  var vegatarianFilterset=false;
  var _veganFilterset=false;
  @override
  void initState() {
    super.initState();
    final activeFilters=ref.read(filtersprovider); //# This'll help to connect this filters to activefilters in providers , This is a functionality of riperpod package 
    _gluttenFreeFilterset = activeFilters[Filter.glutenFree]!; //! Make sure to Connect activefilters like this and do not write widget.activefilters else it will give very bad errors 
    _lactoseFreeFilterset = activeFilters[Filter.lactoseFree]!;
    vegatarianFilterset = activeFilters[Filter.vegetarian]!;
    _veganFilterset = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: PopScope( 
        canPop:false ,
        onPopInvoked: (didPop){ //# This popscope will Help in Providing filters Functionality , Manages back navigation gestures in App
        if(didPop )return; 
         ref.read(filtersprovider.notifier).setFilters(  //* To check the required modifications for this entire thing to happen make sure to check the first coimment in the course L-190
        {
        Filter.glutenFree: _gluttenFreeFilterset,
        Filter.lactoseFree: _lactoseFreeFilterset,
        Filter.vegetarian:vegatarianFilterset,
        Filter.vegan:_veganFilterset,
        });
        Navigator.of(context).pop();
      },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFilterset,
              onChanged: (ischecked) {setState(() {
                _gluttenFreeFilterset=ischecked;//todo: Make sure to assign is checked to _gluttenfreeFilterSet in order to check if the Toggle is on or Off 
              });},  //? is Checked will check if the ToggleButton is pressed on or off 
              title: Text(
                "Gluten Free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Gluten-Free Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            )
          ,  SwitchListTile(
              value: _lactoseFreeFilterset,
              onChanged: (ischecked) {setState(() {
                _lactoseFreeFilterset=ischecked;
              });}, 
              title: Text(
                "Lactose Free ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Lactose-Free Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),  SwitchListTile(
              value: vegatarianFilterset,
              onChanged: (ischecked) {setState(() {
                vegatarianFilterset=ischecked;
              });}, 
              title: Text(
                "Vegetarian",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Vegetarian Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
             ), SwitchListTile(
              value: _veganFilterset,
              onChanged: (ischecked) {setState(() {
                _veganFilterset=ischecked;
              });}, 
              title: Text(
                "Vegan",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: const Text("Only includes Vegan  Meals "),
              activeColor: Theme.of(context).colorScheme.tertiary,
            )],
        ),
      ),
    );
  }
}
