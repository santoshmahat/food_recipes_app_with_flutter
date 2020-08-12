import 'package:ecommerce_app/dummy_data.dart';
import 'package:ecommerce_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = 'category-meals';
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];

    final catMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: catMeals[index].id,
            title: catMeals[index].title,
            imageUrl: catMeals[index].imageUrl,
            duration: catMeals[index].duration,
            complexity: catMeals[index].complexity,
            affordability: catMeals[index].affordability,
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
