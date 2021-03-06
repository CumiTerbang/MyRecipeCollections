import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_recipe_collections/data/api_services.dart';
import 'package:my_recipe_collections/data/recipedetail_data.dart';
import 'package:my_recipe_collections/ui/detailpage/loadingdetail_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.recipe_id, required this.title})
      : super(key: key);
  final String recipe_id;
  final String title;

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  late Future<RecipeDetailData> futureRecipeDetailData;

  @override
  void initState() {
    log("DetailPage | recipe_id: ${widget.recipe_id}");
    futureRecipeDetailData = getDetailRecipe(widget.recipe_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getFutureBuilder(), //because in this page the api just called once, we use FutureBuilder
    );
  }

  Widget getFutureBuilder() {
    return FutureBuilder<RecipeDetailData>(
        future: futureRecipeDetailData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                child: buildBodyContent(context, snapshot.data!));
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          // By default, show a loading spinner.
          // return Center(child: const CircularProgressIndicator());
          return LoadingShimmerDetailPage();
        });
  }

  Widget buildBodyContent(BuildContext context, RecipeDetailData item) {
    return Center(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _thumbnail(item),
          titleTextBox(item.recipe.title,
              TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          subtitleTextBox(
            item.recipe.publisher,
            TextStyle(fontSize: 16.0),
          ),
          parseIngredient(item.recipe.ingredients, TextStyle(fontSize: 16.0)),
          buttonOpenBrowser(item.recipe),
          Divider(height: 20.0,)
        ]),
      ),
    );
  }

  Widget buttonOpenBrowser(RecipeDetailData_recipe item) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 200),
        child: ElevatedButton(
            child: Text("Visit The Web Page"),
            onPressed: () {
              _launchURL(item.source_url);
            }),
      ),
    );
  }

  void _launchURL(_url) async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      SnackBar snackBar = SnackBar(
        content: Text('Could not launch $_url'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget parseIngredient(List<String> ingredients, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            ingredients.map<Widget>((v) => Text(v, style: style)).toList(),
      ),
    );
  }

  Widget titleTextBox(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget subtitleTextBox(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget _thumbnail(RecipeDetailData item) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
          child: FadeInImage.assetNetwork(
        placeholder: "assets/my_logo.png",
        image: item.recipe.image_url,
        fit: BoxFit.cover,
      )),
    );
  }
}
