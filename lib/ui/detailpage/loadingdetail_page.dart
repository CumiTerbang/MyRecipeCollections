import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_recipe_collections/data/api_services.dart';
import 'package:my_recipe_collections/data/recipedetail_data.dart';
import 'package:my_recipe_collections/utils/MyConstants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class LoadingShimmerDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
          baseColor: (Colors.grey[300])!,
          highlightColor: (Colors.grey[100])!,
          enabled: true,
          child: buildBodyContent(context)),
    );
  }

  Widget buildBodyContent(BuildContext context) {
    return Center(
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _thumbnail(),
          titleTextBox(),
          subtitleTextBox(),
          Divider(height: 15.0),
          textBox(),
        ]),
      ),
    );
  }

  Widget textBox() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 16.0,
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Container(
              height: 16.0,
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
            ),
          ),
          Container(
            height: 16.0,
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Container(
              height: 16.0,
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
            ),
          ),
          Container(
            height: 16.0,
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Container(
              height: 16.0,
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
            ),
          ),
          Container(
            height: 16.0,
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
          ),
          FractionallySizedBox(
            widthFactor: 0.8,
            child: Container(
              height: 16.0,
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget titleTextBox() {
    return FractionallySizedBox(
      widthFactor: 0.6,
      child: Container(
        height: 24.0,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
      ),
    );
  }

  Widget subtitleTextBox() {
    return FractionallySizedBox(
      widthFactor: 0.4,
      child: Container(
        height: 16.0,
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
      ),
    );
  }

  Widget _thumbnail() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}
