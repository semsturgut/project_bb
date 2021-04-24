import 'package:flutter/material.dart';
import 'package:project_bb/models/comic.dart';
import 'package:project_bb/widgets/network_image_widget.dart';

class ComicDetailScreen extends StatelessWidget {
  final Comic comic;

  const ComicDetailScreen({Key key, this.comic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(comic.title),
            NetworkImageWidget(url: comic.img),
            Text(comic.alt),
          ],
        ),
      ),
    );
  }
}
