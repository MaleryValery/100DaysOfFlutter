import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
  final Map<Filter, bool>? currentFilters;
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeSet = false;
  var _lactoseFreeSet = false;
  var _vegetarianFreeSet = false;
  var _veganFreeSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeSet = widget.currentFilters![Filter.glutenFree]!;
    _lactoseFreeSet = widget.currentFilters![Filter.lactoseFree]!;
    _vegetarianFreeSet = widget.currentFilters![Filter.vegetarian]!;
    _veganFreeSet = widget.currentFilters![Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeSet,
              Filter.lactoseFree: _lactoseFreeSet,
              Filter.vegetarian: _vegetarianFreeSet,
              Filter.vegan: _veganFreeSet,
            });
            return false;
          },
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeSet,
                onChanged: (isChecked) => setState(() {
                  _glutenFreeSet = isChecked;
                }),
                title: Text(
                  "Gluten-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only include gluten-free meals.",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _lactoseFreeSet,
                onChanged: (isChecked) => setState(() {
                  _lactoseFreeSet = isChecked;
                }),
                title: Text(
                  "Lactose-free",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only include Lactose-free meals.",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _vegetarianFreeSet,
                onChanged: (isChecked) => setState(() {
                  _vegetarianFreeSet = isChecked;
                }),
                title: Text(
                  "Vegetatian",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only include vegetarian meals.",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _veganFreeSet,
                onChanged: (isChecked) => setState(() {
                  _veganFreeSet = isChecked;
                }),
                title: Text(
                  "Vegan",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                subtitle: Text(
                  "Only include vegan meals.",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        ));
  }
}
