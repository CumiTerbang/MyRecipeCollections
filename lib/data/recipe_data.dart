class RecipeData {
  final num count;
  final List<RecipeData_recipes> recipes;

  RecipeData({required this.count, required this.recipes});

  factory RecipeData.fromJson(dynamic json) {
    var recipesObjJson = json['recipes'] as List;
    List<RecipeData_recipes> _recipes = recipesObjJson
        .map((recipeJson) => RecipeData_recipes.fromJson(recipeJson))
        .toList();

    return RecipeData(count: json['count'], recipes: _recipes);
  }

  @override
  String toString() {
    return '{${this.count},${this.recipes}}';
  }
}

class RecipeData_recipes {
  final String publisher;
  final String title;
  final String source_url;
  final String recipe_id;
  final String image_url;
  final num social_rank;
  final String publisher_url;

  RecipeData_recipes(
      {required this.publisher,
      required this.title,
      required this.source_url,
      required this.recipe_id,
      required this.image_url,
      required this.social_rank,
      required this.publisher_url});

  factory RecipeData_recipes.fromJson(dynamic json) {
    return RecipeData_recipes(
        publisher: json['publisher'],
        title: json['title'],
        source_url: json['source_url'],
        recipe_id: json['recipe_id'],
        image_url: json['image_url'],
        social_rank: json['social_rank'],
        publisher_url: json['publisher_url']);
  }

  @override
  String toString() {
    return '{${this.publisher},${this.title},${this.source_url},${this.recipe_id},${this.image_url},${this.social_rank},${this.publisher_url}';
  }
}
