class RecipeDetailData {
  final RecipeDetailData_recipe recipe;

  RecipeDetailData({required this.recipe});

  factory RecipeDetailData.fromJson(Map<String, dynamic> json) {
    return RecipeDetailData(
        recipe: RecipeDetailData_recipe.fromJson(json['recipe']));
  }

  @override
  String toString() {
    return "{${recipe}";
  }
}

class RecipeDetailData_recipe {
  final String publisher;
  final List<String> ingredients;
  final String source_url;
  final String recipe_id;
  final String image_url;
  final num social_rank;
  final String publisher_url;
  final String title;

  RecipeDetailData_recipe(
      {required this.publisher,
      required this.title,
      required this.source_url,
      required this.recipe_id,
      required this.image_url,
      required this.social_rank,
      required this.publisher_url,
      required this.ingredients});

  factory RecipeDetailData_recipe.fromJson(Map<String, dynamic> json) {
    List<String> _ingredients = [""];

    try {
      var ingredientsObjJson = json['ingredients'];
      _ingredients = ingredientsObjJson.cast<String>();
    } on Exception catch (_) {
      print('never reached');
    }

    return RecipeDetailData_recipe(
        publisher: json['publisher'] ?? "",
        title: json['title'] ?? "",
        source_url: json['source_url'] ?? "",
        recipe_id: json['recipe_id'] ?? "",
        image_url: json['image_url'] ?? "",
        social_rank: json['social_rank'] ?? 0,
        publisher_url: json['publisher_url'] ?? "",
        ingredients: _ingredients);
  }

  @override
  String toString() {
    return '{${this.publisher},${this.title},${this.source_url},${this.recipe_id},${this.image_url},${this.social_rank},${this.publisher_url},${this.ingredients}}';
  }
}
