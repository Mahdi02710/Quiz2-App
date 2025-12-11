import 'package:flutter/material.dart';
import '../data/recipes.dart';
import '../models/recipe.dart';
import '../widgets/recipe_item.dart';

class RecipesScreen extends StatelessWidget {
  final Function() onSubmit;
  final Function(int index, String emoji) onSelectRating;

  const RecipesScreen({
    super.key,
    required this.onSubmit,
    required this.onSelectRating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  recipes.length,
                  (index) => RecipeItem(
                    recipe: recipes[index],
                    index: index,
                    onSelectRating: onSelectRating,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onSubmit,
            child: const Text("Submit Ratings"),
          ),
        ],
      ),
    );
  }
}
