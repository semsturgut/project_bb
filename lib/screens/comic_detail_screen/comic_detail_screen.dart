import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_bb/models/comic.dart';

class ComicDetailScreen extends StatelessWidget {
  final Comic comic;

  const ComicDetailScreen({Key key, this.comic}) : super(key: key);

  /// TODO: Generic error texts.
  static const String _errorText = "Error happened.";

  /// TODO: Add error handling 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(comic.title ?? _errorText),
            CachedNetworkImage(
              imageUrl: comic.img,
              placeholder: (_, __) => CircularProgressIndicator(),
              errorWidget: (_, __, ___) => Icon(Icons.error),
            ),
            Text(comic.alt ?? _errorText),
          ],
        ),
      ),
    );
  }
}
