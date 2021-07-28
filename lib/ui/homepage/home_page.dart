import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe_collections/data/api_services.dart';
import 'package:my_recipe_collections/ui/detailpage/detail_page.dart';
import 'package:my_recipe_collections/ui/homepage/home_headline_listtile.dart';
import 'package:my_recipe_collections/data/recipe_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late Future<RecipeData> futureRecipeData;

  @override
  void initState() {
    String q = "pizza";
    futureRecipeData = getSearch(q);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: getFutureBuilder(),
      ),
    );
  }

  Widget getFutureBuilder() {
    return FutureBuilder<RecipeData>(
        future: futureRecipeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // return Text(snapshot.data!.title);
            return buildBodyContent(context, snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          // By default, show a loading spinner.
          return Center(child: const CircularProgressIndicator());
        });
  }

  ConstrainedBox buildButtonComingSoon(
      BuildContext context, String label, String msg) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200),
      child: ElevatedButton(
          child: Text(label),
          onPressed: () {
            SnackBar snackBar = SnackBar(
              content: Text(msg),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }),
    );
  }

  Container imageBox(String imgsrc) {
    return Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(imgsrc))));
  }

  Widget buildBodyContent(BuildContext context, RecipeData data) {
    // List<RecipeData> items = List<RecipeData>.generate(
    //     20,
    //     (i) =>
    //         RecipeData("title ${i}", "subtitle ${i}", "assets/background.jpg"));

    return ListView.builder(
      itemCount: data.count.toInt(),
      itemBuilder: (context, index) {
        return home_headline_listtile(data.recipes[index], () {
          openDetailPage(context, data.recipes[index]);
        });
      },
    );
  }

  void openDetailPage(BuildContext context, RecipeData_recipes item) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(recipe_id: item.recipe_id, title: item.title,)));
  }
}
