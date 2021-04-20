import 'package:flutter/material.dart';

class ComicListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Function onTap;

  const ComicListTile({
    Key key,
    @required this.leading,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      leading: leading,
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => onTap(),
    );
  }
}
