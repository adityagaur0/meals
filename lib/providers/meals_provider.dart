import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

//setting up provider and can use it in need of use.
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
/*provider claus provided by flutter riverpod
 now to instantiate this provider clause
we create a provider object from which we can listen to inside our widget.
store this object using variable to reuse this object later.
// meals provider aka to app meals data here.
this provider clause need atleast one parameter .
the one positional parameter is of type function.
this function recieve the providerRef Object.
because this function we pass to provider will be called by riverpod package.
this fn recieve a ref as mentioned, which is of type provider ref .
and inside of this function we should pass the value we should provide 
example dummy meals 
 */
