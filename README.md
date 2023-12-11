# Section 8: (Meals App) Building Multi-Screen Apps & Navigating Between Screens
### 1.  Managing sceen stacks.
### 2.  Working with Tab bars.
### 3.  Using side Drawers.


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
 1.Card: use card widget also used in expense tracker.
 2.Stack : help us to stack the widget on top of each other.
 3.FadeInImage: image transition.(Creates a widget that displays a [placeholder] while an [image] is loading, then fades-out the placeholder and fades-in the image.)
 4.MemoryImage: Creates an object that decodes a [Uint8List] buffer as an image.
 5.transparent_image: ^2.0.1(pacakge): used as placeholder which will be transparent in FadeInImage.
 6.NetworkImage :acces the online image.
 7.Positioned : Creates a widget that controls where a child of a [Stack] is positioned.


### 9. Improving the MealItem Widget(161)

### 10. Adding Navigation to the MealDetails Screen(162)

### 11. 163. Improving the MealDetails Screen

### 12. 164. Adding Tab-based Navigation

### 13. 165. Passing Functions Through Multiple Layers of Widgets (for State Management)




