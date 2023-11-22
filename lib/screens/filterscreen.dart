import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarion,
  vegan,
}

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });
  // final Map<Filter, bool> currentFilters;
//   @override
//   ConsumerState<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {
//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarionFilterSet = false;
//   var _veganFilterSet = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final activeFilter = ref.read(filtersProvider);
  //   _glutenFreeFilterSet = activeFilter[Filter.glutenFree]!;
  //   _lactoseFreeFilterSet = activeFilter[Filter.lactoseFree]!;
  //   _vegetarionFilterSet = activeFilter[Filter.vegetarion]!;
  //   _veganFilterSet = activeFilter[Filter.vegan]!;
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   filterScreenopen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).push(
      //         MaterialPageRoute(
      //           builder: (context) => const TabScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body:

          //  WillPopScope(
          //   onWillPop: () async {
          //     ref.read(filtersProvider.notifier).setFilters({
          //       Filter.glutenFree: _glutenFreeFilterSet,
          //       Filter.lactoseFree: _lactoseFreeFilterSet,
          //       Filter.vegetarion: _vegetarionFilterSet,
          //       Filter.vegan: _veganFilterSet,
          //     });
          //     // Navigator.of(context).pop();
          //     return true;
          //   },
          //   child:

          Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.glutenFree]!,
            onChanged: (isChecked) {
              // setState(() {
              //   _glutenFreeFilterSet = isChecked;
              // });

              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include gluten-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include lactose-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegetarion]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarion, isChecked);
            },
            title: Text(
              'Vegetarion',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include Vegetarion meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegan]!,
            onChanged: (isChecked) {
              // setState(() {
              //   _veganFilterSet = isChecked;
              // });

              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include Vegan meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
    // );
  }
}
