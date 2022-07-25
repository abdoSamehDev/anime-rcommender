import 'dart:io';

import 'package:anime/layout/cubit/anime_states.dart';
import 'package:bloc/bloc.dart';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/users_model/users_model.dart';
import '../../shared/components/constants.dart';

class AnimeCubit extends Cubit<AnimeStates> {
  AnimeCubit() : super(SocialInitialState());

  static AnimeCubit get(context) => BlocProvider.of(context);

  List<List<dynamic>> data = [];

  // This function is triggered when the floating button is pressed
  void loadCSV() async {
    emit(AnimeBuildListLoadingState());
    await rootBundle.loadString("assets/anime.csv").then((value) {
      List<List<dynamic>> listData = const CsvToListConverter().convert(value);
      data = listData;
      emit(AnimeBuildListSuccessState());
    }).catchError((error) {
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

  int currentIndex = 0;

  void changeBotNavBar(index) {
    if (index == 1) {
      getUsers();
    }
    // if(index == 0){
    //   getPosts();
    // }
    currentIndex = index;
    emit(SocialChangeBotNavBarState());
  }

  List<Widget> screens = [];

  List<String> titles = [
    'News Feed',
    'Chat',
    // 'New Post',
    'Users',
    'Settings',
  ];

  void getUsers() {}
}
