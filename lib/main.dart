import 'package:ecommerce_app/dummy_data.dart';
import 'package:ecommerce_app/models/Meal.dart';
import 'package:ecommerce_app/screens/categories_screen.dart';
import 'package:ecommerce_app/screens/category_meals_screen.dart';
import 'package:ecommerce_app/screens/filters_screen.dart';
import 'package:ecommerce_app/screens/meal_detail_screen.dart';
import 'package:ecommerce_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegeterian": false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  _toogleFavorite(String mealId) {
    setState(() {
      final existingIndex = _favoriteMeals.indexWhere((meal) {
        return meal.id == mealId;
      });

      if (existingIndex >= 0) {
        _favoriteMeals.removeAt(existingIndex);
      } else {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) {
          return meal.id == mealId;
        }));
      }
    });
  }

  _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  _setFilters(Map<String, bool> filtersData) {
    print(filtersData);
    setState(() {
      _filters = filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });

    print(_availableMeals);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => TabsScreen(_favoriteMeals),
        CategoryMealScreen.routeName: (_) =>
            CategoryMealScreen(_availableMeals),
        MealDetail.routeName: (_) =>
            MealDetail(_toogleFavorite, _isMealFavorite),
        FilterScreen.routeName: (_) => FilterScreen(_filters, _setFilters),
      },

      // like 404 page not found
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
