import 'package:project_bb/models/comic.dart';
import 'package:project_bb/network/network_manager.dart';

class ComicRepository {
  /// TODO: Handle 404-500 status errors
  static Future<Comic> getLatestComic() async {
    return await NetworkManager.instance.getLatestComic();
  }

  static Future<List<Comic>> getListOfComics(
      {int latestComicNumber, int index, Function(int) onIndexChanged}) async {
    List<Comic> _comicList = List<Comic>();
    int counter = 0;
    for (int comicNumber = latestComicNumber;
        comicNumber > latestComicNumber - index;
        comicNumber--) {
      Comic _comic =
          await NetworkManager.instance.getComicFromNumber(number: comicNumber);
      if (onIndexChanged != null) onIndexChanged(++counter);
      _comicList.add(_comic);
    }
    return _comicList;
  }
}
