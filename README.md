 # Section 8: (Meals App) Building Multi-Screen Apps & Navigating Between Screens

## Summary:-

> In this app we can dive into meals, mark them as favorite then also see them here in favourite tabs,
can go to filters and set the different filters which does not affect our favourite but will affect the category


### 1.  Managing sceen stacks.
### 2.  Working with Tab bars.
### 3.  Using side Drawers.

![Screenshot 2023-12-26 at 11 02 21 PM](https://github.com/adityagaur0/meals/assets/112656570/0c7df3e6-3fe3-4c89-866f-a6fb19bb22e2)
![Screenshot 2023-12-26 at 11 02 32 PM](https://github.com/adityagaur0/meals/assets/112656570/ed3e57e4-ac70-45c2-8e42-36ca9d238418)
![Screenshot 2023-12-26 at 11 02 43 PM](https://github.com/adityagaur0/meals/assets/112656570/20078e0e-9448-455c-9310-1662f6083b58)
![Screenshot 2023-12-26 at 11 02 52 PM](https://github.com/adityagaur0/meals/assets/112656570/328f8d15-21fc-48a8-95d0-535991d49d07)

----


##  Appflow 
1. categories.dart  create Gridview
2. create model name category
3. create dummy data  in  data folder
### 2. Screens vs widgets
1. create widget folder to keep all non screen widgets into this folder. 
2. create screen folder to manage all the screens.

### 3. Display categoryItems on the screen
1. in category grid item -> container -> box decoration -> gradient -> child : text - > style.
2. call this

### 4. Making any widget tapable using *INKWELL*
1. using INK WELL instead of Gesture detector cuz  INKWELL provide feedback but GD does not.

### 5. Add Meals Data (156)
1. create -> screen ->meals.dart 
2. Create -> modal -> meal.dart
   - Enums basically are the choices and options which one need to selec
### 6. ***Loading meal data to screen : USING BEST EFFICIENT METHOD(157)***
      - dummy -> modal-> listview BUILDER

### 7. Add CROSS section Navigation (158)
1. using Navigator push in categories.dart
   categories.dart -> meals.dart
### 8. Passing data to the Target screen (159)
1. accesssing dummy meal data in 
```
void _selectcategories(BuildContext context, Category category) {
    //159
    // load the dummy meals data into the their respective category
    // category in the argument is the selected category by the user 
    // and user can now click on it.
    // after clicking the
    final filteredmeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    //158 aka 7

    //dummyMeals.where((meal) => );// 159 aka 8
    //final numbers = <int>[1, 2, 3, 5, 6, 7];
    // var result = numbers.where((x) => x < 5); // (1, 2, 3)
    // result = numbers.where((x) => x > 5); // (6, 7)
    // result = numbers.where((x) => x.isEven); // (2, 6)

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            MealsScreen(title: category.title, meals: filteredmeals),
      ),
    );
  }
```

### 9. StackWidget (160)
 1. Card: use card widget also used in expense tracker.
 2. Stack : help us to stack the widget on top of each other.
 3. FadeInImage: image transition.(Creates a widget that displays a [placeholder] while an [image] is loading, then fades-out the placeholder and fades-in the image.)
 4. MemoryImage: Creates an object that decodes a [Uint8List] buffer as an image.
 5. transparent_image: ^2.0.1(pacakge): used as placeholder which will be transparent in FadeInImage.
 6. NetworkImage :acces the online image.
 7. Positioned : Creates a widget that controls where a child of a [Stack] is positioned.


### 9. Improving the MealItem Widget(161)

### 10. Adding Navigation to the MealDetails Screen(162)

### 11. 163. Improving the MealDetails Screen

### 12. 164. Adding Tab-based Navigation

### 13. 165. Passing Functions Through Multiple Layers of Widgets (for State Management) {BUTTON TO ALLOW USER TO MARK MEAL AS FAV}

### 14 Returning Data When Leaving a Screen [WILL POP SCOPE](https://www.geeksforgeeks.org/flutter-willpopscope-widget/) 174
> The WillPopScope widget is used to control the back button of our smartphone which is at the bottom of the screen. With the help of this widget, we can allow the back button to navigate to the previous page or give the callback False so it can’t navigate us to the previous page. As we can see in the below demo by pressing the back button we aren’t able to go back to the previous screen. So in this article, we will see how to implement WillPopScope Widget.

# documentation
>An Alternative Navigation Pattern: Using Named Routes
In this section, you learned about the recommended navigation approach: Pushing and popping MaterialPageRoute objects to load different screens.
There also exists an alternative approach, though - you can assign names to routes and load your routes via those names. However, that approach is not recommended (for most apps).
Nonetheless, you can explore this alternative approach via the official documentation: https://docs.flutter.dev/development/ui/navigation#using-named-routes

----
----

# Section 9: MANAGING APP WIDE STATE[MEALS APP]
## The problem is:
![Screenshot 2023-12-27 at 2 56 51 AM](https://github.com/adityagaur0/meals/assets/112656570/ee45d1db-ac62-47e2-9767-0b88c95da37b)

> For example, In ***Favourite screen*** we need list of favourite meals so we need favourite state here.
but favourite state gets changed in ***Meals detial screen*** as in this screen we have a button to mark and unmark the favourite meals.
So in theory we need to communicate between these two screen but it is not possible . To resolve it we create a method in ***Tabscreen*** , _toggleFavourite()
to manage the the favourite state. 
This method is not wrong but it is inconvient ,as our app gets more complex, more inconvient it get.

## Solution:
### there are several state management solutions: here we use RIVERPOD.
![Screenshot 2023-12-31 at 4 48 33 AM](https://github.com/adityagaur0/meals/assets/112656570/91aab2bc-4d66-4606-a1fd-5822a3df669a)

### How riverpod package works:
1. we can create a provider(Which is a object created by class provided by riverpod package).
2. this provider can provide a dynamic value or a provide a method that can change that value.
3. And in our application, in any widget we can setup consumer that is connected by the provider by the riverpod package.
4. In the consumer widget we can listen to the changes by the provider or even trigger those changes by the method provided by the provider

=> changes:
```
void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
```
1. stateful to consumerStatefulWidget.
   - @override
   - //State<TabsScreen> createState() => _TabsScreenState(); **provider
   -   ConsumerState<TabsScreen> createState() => _TabsScreenState();
   - }  
   - //class _TabsScreenState extends State<TabsScreen> { **provider
   - class _TabsScreenState extends ConsumerState<TabsScreen> {
2. stateless to consumerWidget.
  - Widget build(BuildContext context, WidgetRef ref)

=> for basic we created meals provider 
```
/*

In Flutter's Riverpod package, the Provider class is used to create providers that supply data to your widgets.
To instantiate a Provider and reuse it later in your widget, you can create a provider object and store it in a variable.
For example, let's say you want to create a provider for meals in your app.
This provider requires at least one parameter, which is a function.
This function receives a ProviderRef object, as it will be called by the Riverpod package.
The function you pass to the provider should take the ProviderRef object as a parameter.
Inside this function, you need to provide the value that the provider will supply.
For instance, you can use this function to generate dummy meal data. 
 */
// Creating a provider for meals data in the app.
final mealsProvider = Provider((providerRef) {
  // The function receives a reference to the provider.
  // Inside this function, you should provide the value for the provider.
  // Return the value you want the provider to supply.
  return dummyMeals;
});


```
and call it into tabs.dart
```
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

  final List<Meal> _favoriteMeals = [];

  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                    currentFilters: _selectedFilters,
                  )));

      print(result);
      setState(() {
        _selectedFilters = result ??
            kInitialFilters; //?? matlab aagr result null hai toh k initial call kro
      });

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

  void _toggleMealFavoriteStatus(Meal meal) {
    //use this function in meals details screen
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Meal is no longer a favourite.");
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage("Marked as favourite!");
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*assume ref as a  widget. The property we use to widget.
    Now we have a ref property available to set up listeners for the provider,
    - ref available here due to consumerStatefulWidget above.
    * Ref HAS TWO PROPERTY:
     1. read(): to get data from the provider once
     2. watch(): to set up a listener which makes sure the build method executes again as our data changes.
    ** recommended **: to use a watch() even if the read() is required.
     watch needs the parameter PROVIDER
    */
    final meals=ref.read(mealsProvider);  // **provider
    final availableMeals = meals.where((meal) {
```

### next create favourites_provider: 
the idea is to build a provider that stores the favorite meals into the list of favorite meals.

>
Here we don't use the ***provider*** class as it is used for static dummy data
.Like in meals_provider (a list that never changes).
But, for complex data that should that can change under certain circumstances,
Use the ***StateNotifierProvider*** class instead, it is optimized for the data that can change.


----
----

# Animations[MEALS APP]
