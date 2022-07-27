import 'package:anime/modules/anime_details/anime_details_screen.dart';
import 'package:anime/shared/components/components.dart';
import 'package:anime/shared/styles/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/anime_cubit.dart';
import '../../layout/cubit/anime_states.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeCubit, AnimeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AnimeCubit.get(context);
        List jsonData = cubit.jsonData;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Search',
          ),
          body: ConditionalBuilder(
            condition: jsonData.isNotEmpty,
            builder: (context) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).iconTheme.color,
                          // size: 50,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ?? Colors.grey[500]!,
                            // Colors.grey[500]!,
                            // defaultDarkColor,
                              // color: Color(0xff045c99),
                              ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Theme.of(context).bottomNavigationBarTheme.selectedItemColor ?? defaultDarkColor,
                              // defaultDarkColor,
                            // color: Color(0xff045c99),
                          ),
                        ),
                        label: Text('Search'),
                        fillColor: Colors.white,
                        labelStyle:
                            Theme.of(context).textTheme.caption?.copyWith(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                      ),
                    ),
                  ),
                  // defaultTextFormField(
                  //     label: 'Search',
                  //     type: TextInputType.text,
                  //     controller: searchController,
                  //     validateReturn:
                  //     'please enter anime name that you want to search for',
                  //     prefix: Icons.search),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 10),
                      child: InkWell(
                        onTap: () {
                          navigateTo(context, AnimeDetailsScreen(index: index));
                        },
                        child: ListTile(
                          leading: Image(
                            image: NetworkImage(
                              jsonData[index]['main_picture']['large']
                                  .toString(),
                            ),
                          ),
                          title: Text(
                            jsonData[index]['title'].toString(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          subtitle: Text(
                            'Episodes: ${jsonData[index]['num_episodes'].toString()}',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => mySeparator(),
                    itemCount: 20,
                  ),
                ],
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
