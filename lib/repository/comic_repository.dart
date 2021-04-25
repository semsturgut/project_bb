import 'package:project_bb/models/comic.dart';
import 'package:project_bb/network/network_manager.dart';

class ComicRepository {
  Future<dynamic> getLatestComic() async {
    return await NetworkManager.instance.getLatestComic();
  }

  Future<Comic> getComic(int comicNumber) async {
    return await NetworkManager.instance
        .getComicFromNumber(number: comicNumber);
  }

  Future<List<Comic>> getListOfComics(
      {int latestComicNumber, int index, Function(int) onIndexChanged}) async {
    List<Comic> _comicList = [];
    int _counter = 0;
    for (int comicNumber = latestComicNumber;
        comicNumber > latestComicNumber - index;
        comicNumber--) {
      if (comicNumber <= 0) break;
      // if (_counter == 5) comicNumber = comicNumber + 99; // Crash test - 1
      Comic _comic = await getComic(comicNumber);
      _comicList.add(_comic);
      // if (_counter == 5) comicNumber = comicNumber - 99; // Crash test - 1
      if (onIndexChanged != null) onIndexChanged(++_counter);
    }
    return _comicList;
  }
}
