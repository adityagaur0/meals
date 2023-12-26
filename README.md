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


