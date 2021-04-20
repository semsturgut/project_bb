import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bb/screens/comic_list_screen/comic_list_screen.dart';
import 'package:project_bb/services/bloc_observer_service.dart';

Future<void> main() async {
  await _initialize();
  runApp(App());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverService();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brain&Breads',
      home: ComicListScreen(),
    );
  }
}
