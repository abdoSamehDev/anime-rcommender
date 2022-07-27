import 'package:anime/layout/cubit/anime_cubit.dart';
import 'package:anime/shared/bloc_observer.dart';
import 'package:anime/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/anime_list_screen/anime_list_screen.dart';


void main() async {
  BlocOverrides.runZoned(
      () async{
        WidgetsFlutterBinding.ensureInitialized();
        runApp(const MyApp());
      },
      blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AnimeCubit()..loadJson(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: AnimeListScreen()
      ),
    );
  }
}


