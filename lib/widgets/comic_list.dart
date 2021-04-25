import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_bb/models/comic.dart';
import 'package:project_bb/widgets/comic_list_tile.dart';
import 'package:project_bb/widgets/loading_widget.dart';
import 'package:project_bb/widgets/network_image_widget.dart';

const double _loadMoreMargin = 100;

class ComicList extends StatefulWidget {
  final List<Comic> comicList;
  final Function(Comic, int) onTap;
  final Function onMaxScroll;
  final Widget loadMoreWidget;
  final bool moreLoading;
  final Function onRefresh;
  final int reLoadingIndex;

  const ComicList({
    Key key,
    @required this.comicList,
    @required this.onTap,
    @required this.onMaxScroll,
    @required this.loadMoreWidget,
    @required this.moreLoading,
    @required this.onRefresh,
    this.reLoadingIndex,
  }) : super(key: key);

  @override
  _ComicListState createState() => _ComicListState();
}

class _ComicListState extends State<ComicList> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    /// Pagination Listener
    _scrollController.addListener(() {
      if (_scrollController.offset >
              _scrollController.position.maxScrollExtent + _loadMoreMargin &&
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          widget.onMaxScroll != null &&
          !widget.moreLoading) {
        widget.onMaxScroll.call();
      }
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
          return _buildTile(index);
        },
      ),
    );
  }

  Widget _buildTile(int index) {
    if (widget.comicList.length == index) {
      return widget.moreLoading ? widget.loadMoreWidget : SizedBox();
    } else if (widget.reLoadingIndex == index) {
      return LoadingWidget();
    } else if (widget.comicList.isNotEmpty) {
      return ComicListTile(
        leading: NetworkImageWidget(url: widget.comicList.elementAt(index).img),
        title: widget.comicList.elementAt(index).title,
        onTap: () => widget.onTap(widget.comicList.elementAt(index), index),
      );
    } else {
      return SizedBox();
    }
  }
}
