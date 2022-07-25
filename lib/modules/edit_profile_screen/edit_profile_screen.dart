import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/anime_cubit.dart';
import '../../layout/cubit/anime_states.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeCubit, AnimeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AnimeCubit.get(context);
        return Scaffold(

        );
      },
    );
  }
}
