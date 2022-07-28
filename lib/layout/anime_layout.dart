import 'package:anime/modules/search_screen/search_screen.dart';
import 'package:anime/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/styles/colors.dart';
import '../shared/styles/icon_broken.dart';
import 'cubit/anime_cubit.dart';
import 'cubit/anime_states.dart';

class AnimeLayoutScreen extends StatelessWidget {
  const AnimeLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return BlocConsumer<AnimeCubit, AnimeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AnimeCubit.get(context);
            // print(FirebaseAuth.instance.currentUser!.emailVerified);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  cubit.titles[cubit.currentIndex],
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.brightness_4_outlined),
                    onPressed: (){
                      cubit.toggleDarkMode();
                    },
                  ),
                  IconButton(
                    icon: const Icon(IconBroken.Search),
                    onPressed: (){
                      navigateTo(context, SearchScreen());
                    },
                  ),
                  // IconButton(
                  //   icon: const Icon(IconBroken.Notification),
                  //   onPressed: (){
                  //   },
                  // ),

                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.Filter),
                    label: 'Anime List',

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.Heart),
                    label: 'Favourites',
                  ),

                  // BottomNavigationBarItem(
                  //   icon: Icon(Icons.add_circle_outline),
                  //   label: 'Post',
                  // ),
                  BottomNavigationBarItem(
                    icon: Icon(IconBroken.Setting),
                    label: 'Settings',
                  ),
                ],
                currentIndex: cubit.currentIndex,
                onTap: (index){
                  cubit.changeBotNavBar(index);
                },

              ),
              body: cubit.screens[cubit.currentIndex],
            );
          },
        );
  }
}
// ConditionalBuilder(
//   condition: SocialCubit.get(context).model != null,
//   builder: (context) => Column(
//     children: [
//       if(!FirebaseAuth.instance.currentUser!.emailVerified)
//           Container(
//             color: Colors.amber.withOpacity(0.7),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 children: [
//                   const Icon(
//                     Icons.info_outline,
//                     // color: Colors.white,
//                     size: 18,
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   const Expanded(
//                     child: Text(
//                       'Please Verify Your Email...',
//                       style: TextStyle(
//                         color: Colors.black,
//                         // fontWeight: FontWeight.normal,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       FirebaseAuth.instance.currentUser
//                           ?.sendEmailVerification().then((value) {
//                         showToast(msg: 'Check your mail',
//                             state: ToastStates.success);
//                       });
//                     },
//                     child: const Text(
//                       'Send Verification Email',
//                       style: TextStyle(
//                           fontSize: 14
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//     ],
//   ),
//   fallback: (context) => const Center(child: CircularProgressIndicator()),
// ),