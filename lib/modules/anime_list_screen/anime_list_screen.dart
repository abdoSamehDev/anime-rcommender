import 'package:anime/modules/anime_details/anime_details_screen.dart';
import 'package:anime/modules/search_screen/search_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/anime_cubit.dart';
import '../../layout/cubit/anime_states.dart';
import '../../models/posts_model/post_model.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/icon_broken.dart';

class AnimeListScreen extends StatelessWidget {
  const AnimeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeCubit, AnimeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AnimeCubit.get(context);
        List<List<dynamic>> data = cubit.data;
        List jsonData = cubit.jsonData;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Anime List',
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(
                    IconBroken.Search,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
          body: ConditionalBuilder(
            condition: jsonData.isNotEmpty,
            builder: (BuildContext context) => Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                buildAnimeItem(jsonData, context),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          cubit.scrollToLatestItem();
                        },
                        heroTag: 'listDown',
                        child: const Icon(
                          IconBroken.Arrow___Down,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          cubit.scrollToFirstItem();
                        },
                        heroTag: 'listUp',
                        child: const Icon(
                          IconBroken.Arrow___Up,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            fallback: (BuildContext context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

Widget buildAnimeItem(List data, context) {
  return ListView.separated(
    controller: AnimeCubit.get(context).controller,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => InkWell(
      onTap: () {
        navigateTo(
            context,
            AnimeDetailsScreen(
              index: index,
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    data[index]['main_picture']['large'].toString(),
                  ),
                ),
              ),
              // child: Image(
              //   height: 200,
              //   width: 120,
              //   fit: BoxFit.cover,
              //   image: NetworkImage(
              //     data[index][27].toString(),
              //   ),
              // ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data[index]['title'].toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 20)
                      // const TextStyle(
                      //   fontSize: 20,
                      //   fontWeight: FontWeight.bold,
                      // ),
                      ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Episodes: ${data[index]['num_episodes'].toString()}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Rank: ${data[index]['rank'].toString()}',
                  ),
                ],
              ),
            ),
            // const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(IconBroken.Heart),
            )
          ],
        ),
      ),
    ),
    separatorBuilder: (context, index) => mySeparator(),
    itemCount: data.length,
  );
}
