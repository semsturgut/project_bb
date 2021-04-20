import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final int count;
  final int totalCount;

  const LoadingWidget({Key key, this.count, this.totalCount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          if (count != null && totalCount != null) SizedBox(width: 10),
          if (count != null && totalCount != null)
            Text("Downloading $count/$totalCount")
        ],
      ),
    );
  }
}
