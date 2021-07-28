import 'package:flutter/material.dart';
import 'package:my_recipe_collections/data/recipe_data.dart';

class home_headline_listtile extends StatelessWidget {
  final RecipeData_recipes item;
  final VoidCallback onOpenDetailPage;

  home_headline_listtile(this.item, this.onOpenDetailPage);

  Widget _verticalTile(BuildContext context, RecipeData_recipes item) {
    return InkWell(
      onTap: onOpenDetailPage,
      child: Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
        // margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _thumbnail(item),
            _titleTextBox(item.title,
                TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            _subtitleTextBox(item.publisher, TextStyle(fontSize: 14.0))
          ],
        ),
      ),
    );
  }

  Widget _thumbnail(RecipeData_recipes item) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
          child: FadeInImage.assetNetwork(
        placeholder: "assets/my_logo.png",
        image: item.image_url,
        fit: BoxFit.cover,
      )),
    );
  }

  Widget _titleTextBox(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget _subtitleTextBox(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _verticalTile(context, item);
  }
}
