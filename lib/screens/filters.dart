import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

// enum Filter { glutenFree, lactoseFree, vegitarian, vegan }

// // class FiltersScreen extends ConsumerStatefulWidget {  *********** VIDEO 189 explain below
class FiltersScreen
    extends ConsumerWidget {
  const FiltersScreen({
    super.key,
    // required this.currentFilters,
  });
  // final Map<Filter, bool> currentFilters; **** NO LONGER NEED CUZ FILTER PROVIDER

// //   @override    *********** VIDEO 189 explain below
// //   ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
// // }

// // class _FiltersScreenState extends ConsumerState<FiltersScreen> {
// //   var _glutenFreeFilterSet = false;
// //   var _lactoseFreeFilterSet = false;
// //   var _vegitarianFilterSet = false;
// //   var _veganFilterSet = false;

//   // @override      *********** VIDEO 189 explain below
//   // void initState() {
//   //   super.initState();
//   //   // _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
//   //   // _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
//   //   // _vegitarianFilterSet = widget.currentFilters[Filter.vegitarian]!;
//   //   // _veganFilterSet = widget.currentFilters[Filter.vegan]!;
//   //   final activeFilters =
//   //       ref.read(filtersProvider); // read instead of watch cuz
//   //   // init state is only executed once.
//   //   _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
//   //   _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
//   //   _vegitarianFilterSet = activeFilters[Filter.vegitarian]!;
//   //   _veganFilterSet = activeFilters[Filter.vegan]!;
//   // }
//
  @override
  Widget build(
      BuildContext
          context,
      WidgetRef
          ref) {
    final activeFilters =
        ref.watch(filtersProvider);
    return Scaffold(
      appBar:
          AppBar(
        title: const Text("YourFilters"),
      ),
      // // body: WillPopScope(    *********** VIDEO 189 explain below
      // //   //
      // //   /*
      // // future fn control the flow of back button in phones.
      // // we can use it to pop back or false to not pop back.
      // //  */

      // //   onWillPop: () async {
      // //     //when user wanna tap the back button, i wanna set all my filter.
      // //     ref.read(filtersProvider.notifier).setFilters({
      // //       Filter.glutenFree: _glutenFreeFilterSet,
      // //       Filter.lactoseFree: _lactoseFreeFilterSet,
      // //       Filter.vegitarian: _vegitarianFilterSet,
      // //       Filter.vegan: _veganFilterSet,
      // //     });

      // //     // Navigator.of(context).pop({

      // //     //   Filter.glutenFree: _glutenFreeFilterSet,
      // //     //   Filter.lactoseFree: _lactoseFreeFilterSet,
      // //     //   Filter.vegitarian: _vegitarianFilterSet,
      // //     //   Filter.vegan: _veganFilterSet,
      // //     // });
      // //     // return false;
      // //     return true;
      // //   },

      body:
          Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (ischecked) {
              // // setState(() {      *********** VIDEO 189 explain below
              // //   _glutenFreeFilterSet = ischecked;
              // // });
              ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, ischecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include gluten free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (ischecked) {
              // setState(() {       *********** VIDEO 189 explain below
              //   _lactoseFreeFilterSet = ischecked;
              // });
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, ischecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Lactose free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegitarian]!,
            onChanged: (ischecked) {
              // setState(() {         *********** VIDEO 189 explain below
              //   _vegitarianFilterSet = ischecked;
              // });

              ref.read(filtersProvider.notifier).setFilter(Filter.vegitarian, ischecked);
            },
            title: Text(
              'Vegitarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Vegitarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (ischecked) {
              // setState(() {        *********** VIDEO 189 explain below
              //   _veganFilterSet = ischecked;
              // });
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, ischecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Vegan meals.',
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
  }
}


// 189. OutSourcing state into the provider
/*
we read the filter provider data in line 32 in init state to 
initialise our local state Start line 20 .
which we need to manage to reflect the changes made to the filter
as user click the switches in switch list tile.
Sol: we get rid of local state and manage everything in the provider.
Simply update the Filter Screen widget whenever the data in the provider changes
- to update the switch status in the ui.  
So updating the switch status in the local (eg line 78)
we can change it into provider and rerender the ui.
to reflect the changes on the switch
 */
