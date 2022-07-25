import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
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
        return Scaffold(
          body: ConditionalBuilder(
            condition: data.isNotEmpty,
            builder: (BuildContext context) => Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                buildAnimeItem(data, context),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          cubit.scrollToLatestItem();
                        },
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

Widget buildAnimeItem(List<List> data, context) {
  return ListView.separated(
    controller: AnimeCubit.get(context).controller,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => InkWell(
      onTap: () {},
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
                    data[index + 1][27].toString(),
                  ),
                ),
              ),
              // child: Image(
              //   height: 200,
              //   width: 120,
              //   fit: BoxFit.cover,
              //   image: NetworkImage(
              //     data[index + 1][27].toString(),
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
                  Text(
                    data[index + 1][1].toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Episodes: ${data[index + 1][6].toString()}'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Rank: ${data[index + 1][13].toString()}'),
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
    itemCount: 20,
  );
}
