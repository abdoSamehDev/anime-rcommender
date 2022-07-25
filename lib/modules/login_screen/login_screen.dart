import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/anime_cubit.dart';
import '../../layout/anime_layout.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/chache _helper.dart';
import '../register_screen/register_screen.dart';
import 'login_cubit.dart';
import 'login_states.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginScreenCubit(),
      child: BlocConsumer<LoginScreenCubit, LoginScreenStates>(
        listener: (context, state) {
          if (state is LoginScreenSuccessState) {
            CacheHelper.setData(key: 'uId', value: state.uId).then((value) {
              uId = state.uId;
              showToast(msg: 'Login Successfully!', state: ToastStates.success);
              AnimeCubit.get(context).currentIndex = 0;
              navigateAndReplaceTo(context, SocialLayoutScreen());
            });
          } else if (state is LoginScreenErrorState) {
            showToast(msg: state.error, state: ToastStates.error);
          }

          // if(state is LoginScreenSuccessState){
          //   if(state.loginModel!.status!){
          //     CacheHelper.setData(key: 'token', value: state.loginModel!.data!.token).then((value) {
          //       token = state.loginModel!.data!.token;
          //       HomeScreenCubit.get(context).currentIndex = 0;
          //       HomeScreenCubit.get(context).getProfileData();
          //       navigateAndReplaceTo(context, const HomeScreen());
          //     });
          //
          //     showToast(msg: state.loginModel?.message, state: ToastStates.success);
          //   }
          //   else{
          //     print(state.loginModel?.message);
          //     showToast(msg: state.loginModel?.message, state: ToastStates.error);
          //   }
          //
          // }
        },
        builder: (context, state) {
          var key = GlobalKey<FormState>();
          var cubit = LoginScreenCubit.get(context);
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: key,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[900]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Login now to chat with friends',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        defaultTextFormField(
                          label: 'Email Address',
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          validateReturn: 'Please enter your mail address',
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextFormField(
                            isPassword: cubit.isPassword,
                            label: 'Password',
                            type: TextInputType.visiblePassword,
                            controller: passwordController,
                            validateReturn: 'Password is too short!',
                            prefix: Icons.lock_outline,
                            suffix: cubit.suffix,
                            suffixButtonFunction: () {
                              cubit.changePasswordVisibility();
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginScreenLoadingState,
                          builder: (BuildContext context) {
                            return defaultButton(
                                function: () {},
                                text: 'Login');
                          },
                          fallback: (BuildContext context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, RegisterScreen());
                              },
                              child: const Text(
                                'Register Now',
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
