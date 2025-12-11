import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double average;
  final String topRecipe;
  final Function() onRestart;

  const ResultScreen({
    super.key,
    required this.average,
    required this.topRecipe,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Average Rating: ${average.toStringAsFixed(1)} ⭐",
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            "Top Recipe: $topRecipe",
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRestart,
            child: const Text("Restart"),
          ),
        ],
      ),
    );
  }
}
