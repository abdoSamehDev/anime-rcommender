import 'package:anime/layout/cubit/anime_cubit.dart';
import 'package:anime/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/anime_states.dart';

class AnimeDetailsScreen extends StatelessWidget {
  // List jsonData = AnimeCubit.get(context).jsonData;
  int index;

  AnimeDetailsScreen({
    Key? key,
    // required this.jsonData,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeCubit, AnimeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AnimeCubit.get(context);
          List jsonData = cubit.jsonData;
          List genres = [];
          jsonData[index]['genres'].forEach((element) {
            genres.add(element['name']);
          });
          return Scaffold(
            appBar: defaultAppBar(context: context),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  openImage(
                                    context: context,
                                    imageProvider: NetworkImage(
                                      jsonData[index]['main_picture']['large']
                                          .toString(),
                                      // 'https://api-cdn.myanimelist.net/images/anime/10/47347l.jpg',
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 300,
                                  width: 200,
                                  // double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        jsonData[index]['main_picture']['large']
                                            .toString(),
                                        // 'https://api-cdn.myanimelist.net/images/anime/10/47347l.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (jsonData[index]['status'] ==
                                  'currently_airing')
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    color: Colors.blue.withOpacity(0.9),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Currently Airing',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (jsonData[index]['status'] ==
                                  'finished_airing')
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Container(
                                    color: Colors.red.withOpacity(0.9),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        'Finished',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 150,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      size: 50,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      jsonData[index]['mean'].toString(),
                                      // '8.53',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(jsonData[index]['title'].toString(),
                                    // 'Shingeki no Kyojin',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(fontSize: 22)),
                                if (jsonData[index]['alternative_titles']['en']
                                        .toString() !=
                                    jsonData[index]['title'].toString())
                                  const SizedBox(
                                    height: 5,
                                  ),
                                if (jsonData[index]['alternative_titles']['en']
                                        .toString() !=
                                    jsonData[index]['title'].toString())
                                  Text(
                                    '(${jsonData[index]['alternative_titles']['en'].toString()})',
                                    // '(Attack on Titan)',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2?.copyWith(
                                        fontSize: 16
                                      )
                                    // const TextStyle(
                                    //     fontSize: 16,
                                    //     fontWeight: FontWeight.w500),
                                  ),
                                const SizedBox(
                                  height: 10,
                                ),

                                // SizedBox(
                                //   height: 5,
                                // ),
                                Text(
                                  '${jsonData[index]['start_season']['season'].toString()} ${jsonData[index]['start_season']['year'].toString()}',
                                  // '2013',
                                  // 'Spring 2013',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                if (jsonData[index]['status'] ==
                                    'currently_airing')
                                  Text(
                                    'Airing Day: ${jsonData[index]['broadcast']['day_of_the_week']}',
                                    // 'Episodes: ${jsonData[index]['num_episodes'].toString()}',
                                    // 'Episodes: ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                  ),
                                if (jsonData[index]['status'] ==
                                    'currently_airing')
                                  const SizedBox(
                                    height: 5,
                                  ),
                                Text(
                                  'Episodes: ${jsonData[index]['num_episodes'].toString()}',
                                  // 'Episodes: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Source: ${jsonData[index]['source'].toString()}',
                                  // 'Source: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Studio: ${jsonData[index]['studios'][0]['name'].toString()}',
                                  // 'Studio: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  genres.toString(),
                                  // '${jsonData[index]['genres'][0]['name'].toString()}',
                                  // 'Action, Drama, Gore, Military, Shounen, Survival',
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2?.copyWith(
                                    height: 1.3
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.grey[400],
                        ),
                      ),
                      Text(
                        'Summary',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1?.copyWith(
                            fontSize: 22
                          ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        jsonData[index]['synopsis'].toString(),
                        // '''Centuries ago, mankind was slaughtered to near extinction by monstrous humanoid creatures called Titans, forcing humans to hide in fear behind enormous concentric walls. What makes these giants truly terrifying is that their taste for human flesh is not born out of hunger but what appears to be out of pleasure. To ensure their survival, the remnants of humanity began living within defensive barriers, resulting in one hundred years without a single titan encounter. However, that fragile calm is soon shattered when a colossal Titan manages to breach the supposedly impregnable outer wall, reigniting the fight for survival against the man-eating abominations.\n\nAfter witnessing a horrific personal loss at the hands of the invading creatures, Eren Yeager dedicates his life to their eradication by enlisting into the Survey Corps, an elite military unit that combats the merciless humanoids outside the protection of the walls. Eren, his adopted sister Mikasa Ackerman, and his childhood friend Armin Arlert join the brutal war against the Titans and race to discover a way of defeating them before the last walls are breached.''',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2?.copyWith(
                            fontWeight: FontWeight.normal,
                            height: 1.3
                          )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultButton(
                        function: () {},
                        text: 'Add to Favourite',
                        width: 200,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
