import 'dart:convert';
import 'dart:developer';

import 'package:my_recipe_collections/data/recipe_data.dart';
import 'package:http/http.dart' as http;
import 'package:my_recipe_collections/data/recipedetail_data.dart';

Future<RecipeData> getSearch(String query) async {
  String url = 'https://forkify-api.herokuapp.com/api/search?q=${query}';
  log("Api Services | url: ${url}");

  final response = await http.get(Uri.parse(url));

  log("Api Services | statusCode: ${response.statusCode}");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log("Api Services | response: ${response.body}");
    return RecipeData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<RecipeDetailData> getDetailRecipe(String recipe_id) async {
  String url = 'https://forkify-api.herokuapp.com/api/get?rId=${recipe_id}';
  log("Api Services | url: ${url}");

  final response = await http.get(Uri.parse(url));

  log("Api Services | statusCode: ${response.statusCode}");
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log("Api Services | response: ${response.body}");
    return RecipeDetailData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
