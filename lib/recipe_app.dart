import 'package:flutter/material.dart';
import 'data/recipes.dart';
import 'models/recipe.dart';
import 'screens/recipes_screen.dart';
import 'screens/result_screen.dart';

class RecipeApp extends StatefulWidget {
  const RecipeApp({super.key});

  @override
  State<RecipeApp> createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  String currentScreen = "recipes";
  List<String> selectedRatings = List.filled(recipes.length, "");

  double get averageRating {
    int sum = 0;
    int count = 0;

    for (var r in selectedRatings) {
      if (r.isNotEmpty) {
        sum += emojiToValue[r]!;
        count++;
      }
    }

    return count == 0 ? 0 : sum / count;
  }

  String get topRecipe {
    int maxVal = -1;
    String best = "";

    for (int i = 0; i < selectedRatings.length; i++) {
      if (selectedRatings[i].isNotEmpty) {
        int v = emojiToValue[selectedRatings[i]]!;
        if (v > maxVal) {
          maxVal = v;
          best = recipes[i].recipeName;
        }
      }
    }

    return best.isEmpty ? "None" : best;
  }

  void selectRating(int index, String rating) {
    setState(() {
      selectedRatings[index] = rating;
    });
  }

  void submit() {
    setState(() {
      currentScreen = "result";
    });
  }

  void restart() {
    setState(() {
      selectedRatings = List.filled(recipes.length, "");
      currentScreen = "recipes";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget;

    if (currentScreen == "recipes") {
      screenWidget = RecipesScreen(
        onSubmit: submit,
        onSelectRating: selectRating,
      );
    } else {
      screenWidget = ResultScreen(
        average: averageRating,
        topRecipe: topRecipe,
        onRestart: restart,
      );
    }

    return Scaffold(
      body: screenWidget,
      backgroundColor: const Color.fromARGB(255, 73, 168, 122),
    );
  }
}
