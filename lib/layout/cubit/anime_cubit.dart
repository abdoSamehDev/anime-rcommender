import 'dart:convert';
import 'dart:io';

import 'package:anime/layout/cubit/anime_states.dart';
import 'package:anime/modules/anime_fav_screen/anime_fav_screen.dart';
import 'package:anime/modules/anime_list_screen/anime_list_screen.dart';
import 'package:anime/modules/settings_screen/settings_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/users_model/users_model.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/chache _helper.dart';

class AnimeCubit extends Cubit<AnimeStates> {
  AnimeCubit() : super(SocialInitialState());

  static AnimeCubit get(context) => BlocProvider.of(context);

  List<List<dynamic>> data = [];

  List jsonData = [];

  // This function is triggered when the floating button is pressed
  void loadCSV() async {
    emit(AnimeBuildListLoadingState());
    await rootBundle.loadString('assets/anime.csv').then((value) {
      data = const CsvToListConverter().convert(value);
      emit(AnimeBuildListSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AnimeBuildListErrorState(error.toString()));
    });
  }

  void loadJson() async {
    emit(AnimeBuildListLoadingState());
        await rootBundle
            .loadString('assets/anime.json')
            .then((value) {
              jsonData = json.decode(value);
              print(jsonData.toString());
              emit(AnimeBuildListSuccessState());
        })
            .catchError((error) {
          print(error.toString());
          emit(AnimeBuildListErrorState(error.toString()));
        });

  }

  final ScrollController controller = ScrollController();

  void scrollDown() {
    controller.jumpTo(controller.position.maxScrollExtent);
    emit(AnimeScrollBotListSuccessState());
  }

  Future<void> scrollToLatestItem() async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (controller.position.pixels < controller.position.maxScrollExtent) {
      await controller.animateTo(
        controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutCubic,
      );
      await scrollToLatestItem();
    }
    emit(AnimeScrollBotListSuccessState());
  }

  Future<void> scrollToFirstItem() async {
    await Future.delayed(const Duration(milliseconds: 50));

    if (controller.position.pixels > controller.position.minScrollExtent) {
      await controller.animateTo(
        controller.position.minScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
      );
      await scrollToFirstItem();
    }
    emit(AnimeScrollTopListSuccessState());
  }

  bool darkMode = false;

  void toggleDarkMode({bool? fromShared}){
    if(fromShared != null){
      darkMode = fromShared;
      emit(AnimeChangeThemeModeState());
    }
    else{
      darkMode = !darkMode;
      CacheHelper.setBool(key: 'isDark', value: darkMode);
      emit(AnimeChangeThemeModeState());
    }
  }

  int currentIndex = 0;

  void changeBotNavBar(index) {
    currentIndex = index;
    emit(AnimeChangeBotNavBarState());
  }

  List<Widget> screens = [
    const AnimeListScreen(),
    const AnimeFavScreen(),
    const SettingsScreen()
  ];

  List<String> titles = [
    'Anime List',
    'Favourites',
    'Settings',
  ];
}
