import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;

  const NetworkImageWidget({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: url,
        placeholder: (_, __) => CircularProgressIndicator(),
        errorWidget: (_, __, ___) => Icon(Icons.error),
      );
}
