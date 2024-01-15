import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/data/dummy_data.dart';
// import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

// const kInitialFilters = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegitarian: false,
//   Filter.vegan: false,
// }; ***  No longer need cux of Filter Provider

//class TabsScreen extends StatefulWidget { ** Provider
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  //State<TabsScreen> createState() => _TabsScreenState(); **provider
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

//class _TabsScreenState extends State<TabsScreen> { **provider
class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  // final List<Meal> _favoriteMeals = []; ***NO NEED CUZ OF PROVIDER

  // Map<Filter, bool> _selectedFilters = kInitialFilters; ***NO NEED CUZ OF PROVIDER

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(message)),
  //   );
  // }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      // final result = await Navigator.of(context).push<Map<Filter, bool>>(
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );

      // setState(() {
      //   _selectedFilters = result ??
      //       kInitialFilters; //?? matlab aagr result null hai toh k initial call kro
      // });

      /*storing the filter like this is not enough bcuz we also make sure build method 
      executed again so that updated filter or updated meal list of available meals is passed
      to the category screen.
      But not to the meals screen cuz we don't want filter the meals that are visible 
      on the screen But we can filter it to but in  this app logic 
      favourite should always be visible no matter what which filter were selected
      that's why here we only worry about category screen

      */
    }
  }
  // ***** NO NEED CUZ OF PROVIDER ********
  // void _toggleMealFavoriteStatus(Meal meal) {
  //   //use this function in meals details screen
  //   final isExisting = _favoriteMeals.contains(meal);
  //   if (isExisting) {
  //     setState(() {
  //       _favoriteMeals.remove(meal);
  //       _showInfoMessage("Meal is no longer a favourite.");
  //     });
  //   } else {
  //     setState(() {
  //       _favoriteMeals.add(meal);
  //       _showInfoMessage("Marked as favourite!");
  //     });
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*assume ref as a  widget. property we use to widget.
    Now we have a ref property available to setup listners for the provider,
    - ref available here due to consumer stateful above.
    * Ref HAS TWO PROPERTY:
     1. read() : to get data from provider once
     2. watch(): to setup listener which make sure build method executes again as our data changes.
    ** recommended ** : to use watch even if read is required.
     watch need the parameter PROVIDER
    */
    //
    /**
     
     CHANGE BELOW LOGIC AND MOVE OUT OF BUILD METHOD TO FILTER_PROVIDER
     */
    // .// final meals = ref.read(mealsProvider); // **provider
    // // final activefilters = ref.watch(filtersProvider);
    // // final availableMeals = meals.where((meal) {
    // //   if (activefilters[Filter.glutenFree]! && !meal.isGlutenFree) {
    // //     return false;
    // //   }
    // //   if (activefilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
    // //     return false;
    // //   }
    // //   if (activefilters[Filter.vegitarian]! && !meal.isVegetarian) {
    // //     return false;
    // //   }
    // //   if (activefilters[Filter.vegan]! && !meal.isVegan) {
    // //     return false;
    // //   }
    // //   return true;
    // // }).toList();
    final availableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(
      // onToggleFavourite: _toggleMealFavoriteStatus,**  NO NEED CUZ OF PROVIDER
      availableMeals: availableMeals,
    );
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      /*
      SETUP THE WATCHER HERE: to Get our fav meals.
       */
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(
        // meals: _favoriteMeals,
        meals: favouriteMeals,
        // onToggleFavourite: _toggleMealFavoriteStatus, **  NO NEED CUZ OF PROVIDER
      );
      activePageTitle = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
