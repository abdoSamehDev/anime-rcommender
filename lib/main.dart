import 'package:anime/layout/anime_layout.dart';
import 'package:anime/layout/cubit/anime_cubit.dart';
import 'package:anime/layout/cubit/anime_states.dart';
import 'package:anime/shared/bloc_observer.dart';
import 'package:anime/shared/network/local/chache%20_helper.dart';
import 'package:anime/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/anime_list_screen/anime_list_screen.dart';


void main() async {
  BlocOverrides.runZoned(
      () async{
        WidgetsFlutterBinding.ensureInitialized();
        await CacheHelper.init();
        final bool? isDark = CacheHelper.getBool(key: 'isDark');
        runApp(MyApp(isDark: isDark,));
      },
      blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  const MyApp({super.key, this.isDark, this.startWidget});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AnimeCubit()..loadJson()..toggleDarkMode(fromShared: isDark),
      child: BlocConsumer<AnimeCubit, AnimeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AnimeCubit.get(context);
          bool? darkModeOn = cubit.darkMode;
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Anime Recommender',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: darkModeOn ? ThemeMode.dark : ThemeMode.light,
              home: AnimeLayoutScreen()
          );
        },
      ),
    );
  }
}


