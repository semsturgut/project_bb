import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_bb/models/comic.dart';
import 'package:project_bb/widgets/comic_list_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';

const double _loadMoreMargin = 100;

class ComicList extends StatefulWidget {
  final List<Comic> comicList;
  final Function(Comic) onTap;
  final Function onMaxScroll;
  final Widget loadMoreWidget;
  final bool moreLoading;
  final Function onRefresh;

  const ComicList({
    Key key,
    @required this.comicList,
    @required this.onTap,
    @required this.onMaxScroll,
    @required this.loadMoreWidget,
    @required this.moreLoading,
    @required this.onRefresh,
  }) : super(key: key);

  @override
  _ComicListState createState() => _ComicListState();
}

class _ComicListState extends State<ComicList> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset >
                _scrollController.position.maxScrollExtent + _loadMoreMargin &&
            _scrollController.position.userScrollDirection ==
                ScrollDirection.reverse &&
            widget.onMaxScroll != null) {
          widget.onMaxScroll.call();
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(milliseconds: 100), () {
          if (widget.onRefresh() != null) widget.onRefresh();
        });
      },
      child: ListView.builder(
        itemCount: widget.comicList.length + 1,
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index == widget.comicList.length) {
            return widget.moreLoading ? widget.loadMoreWidget : SizedBox();
          }
          return ComicListTile(
            leading: CachedNetworkImage(
              imageUrl: widget.comicList.elementAt(index).img,
              placeholder: (_, __) => CircularProgressIndicator(),
              errorWidget: (_, __, ___) => Icon(Icons.error),
            ),
            title: widget.comicList.elementAt(index).title,
            onTap: () => widget.onTap(widget.comicList.elementAt(index)),
          );
        },
      ),
    );
  }
}
