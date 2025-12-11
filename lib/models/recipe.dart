class Recipe {
  final String recipeName;
  List<String> emojiRatings;
  Recipe({required this.recipeName, required this.emojiRatings});
}

Map<String, int> emojiToValue = {"😀": 4, "🙂": 3, "😐": 2, "😔": 1};
