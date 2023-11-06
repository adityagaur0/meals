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
