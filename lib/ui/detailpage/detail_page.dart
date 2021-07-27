import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:my_recipe_collections/data/recipe_data.dart';
import 'package:my_recipe_collections/utils/MyConstants.dart';
import 'package:my_recipe_collections/utils/MyCustomWidgets.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.item}) : super(key: key);
  final RecipeData item;

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  Widget buildBodyContent(BuildContext context) {
    return Center(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _thumbnail(widget.item),
          textBox(
              lipsum, TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          textBox(
            lipsum_longer_more,
            TextStyle(fontSize: 16.0),
          )
        ]),
      ),
    );
  }

  Widget textBox(String text, TextStyle style) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  Widget _thumbnail(RecipeData item) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
          child: Image.asset(
        item.imageurl,
        fit: BoxFit.cover,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title),
      ),
      body: SingleChildScrollView(
          child: buildBodyContent(context)
      ),
    );
  }
}
