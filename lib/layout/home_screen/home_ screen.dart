import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/onBoarding_screen/onBoarding_screen.dart';
import '../../shared/components/components.dart';
import 'home_cubit.dart';
import 'home_states.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
      listener: (context, state){},
      builder: (context, state){
        var cubit = HomeScreenCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            // centerTitle: true,
            title: Text(
              'Salla'.toUpperCase(),
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, OnBoardingScreen());
                },
                icon: const Icon(Icons.info_outline_rounded),
              ),
              IconButton(
                onPressed: (){
                //   navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBotNavBar(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: 'Categories'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favourites'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings'
              ),
            ],
          ),
          body: cubit.navBarScreens[cubit.currentIndex],
        );
      },
    );
  }
}
