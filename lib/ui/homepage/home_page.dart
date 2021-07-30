import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe_collections/data/api_services.dart';
import 'package:my_recipe_collections/ui/detailpage/detail_page.dart';
import 'package:my_recipe_collections/ui/homepage/home_headline_listtile.dart';
import 'package:my_recipe_collections/data/recipe_data.dart';
import 'package:my_recipe_collections/ui/homepage/loadinghome_page.dart';
import 'package:my_recipe_collections/ui/homepage/search_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  late Future<RecipeData> futureRecipeData;

  String _query = "pizza";

  @override
  void initState() {
    futureRecipeData = getSearch(_query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mySearchAppBar(),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: getFutureBuilder(),
      ),
    );
  }

  Widget appBarTitle = new Text("Home");
  Icon actionIcon = new Icon(Icons.search);

  AppBar mySearchAppBar() {
    return AppBar(title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: actionIcon,
        onPressed: () {
          setState(() {
            if (this.actionIcon.icon == Icons.search) {
              this.actionIcon = new Icon(Icons.close);
              this.appBarTitle = new TextField(
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search..."),
                onSubmitted: (value) {
                  _query = value;
                  setState(() {
                    futureRecipeData = getSearch(_query);
                  });
                },
              );
            } else {
              this.actionIcon = new Icon(Icons.search);
              this.appBarTitle = new Text("Home");
            }
          });
        },
      ),
    ]);
  }

  Widget getFutureBuilder() {
    return FutureBuilder<RecipeData>(
        future: futureRecipeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return LoadingShimmerHomePage();
          }
          if (snapshot.hasData) {
            return buildBodyContent(context, snapshot.data!);
            // return LoadingShimmerHomePage();
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          // By default, show a loading spinner.
          // return Center(child: const CircularProgressIndicator());
          return LoadingShimmerHomePage();
        });
  }

  ConstrainedBox buildButtonComingSoon(BuildContext context, String label,
      String msg) {
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

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Text("found ${data.count.toInt()} recipes of \"${_query}\""),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: data.count.toInt(),
            itemBuilder: (context, index) {
              return home_headline_listtile(data.recipes[index], () {
                openDetailPage(context, data.recipes[index]);
              });
            },
          ),
        ),
      ],
    );
  }

  void openDetailPage(BuildContext context, RecipeData_recipes item) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                DetailPage(
                  recipe_id: item.recipe_id,
                  title: item.title,
                )));
  }
}
