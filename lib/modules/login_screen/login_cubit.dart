import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_states.dart';


class LoginScreenCubit extends Cubit<LoginScreenStates> {
  LoginScreenCubit() : super(LoginScreenInitialState());

  static LoginScreenCubit get(context) => BlocProvider.of(context);


//   void userLogin({
//     required String email,
//     required String password
// }){
//     emit(LoginScreenLoadingState());
//
//     FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password
//     ).then((value) {
//       print(value.user?.email);
//       print(value.user?.uid);
//       emit(LoginScreenSuccessState(value.user!.uid));
//     }).catchError((error){
//       print(error.toString());
//       emit(LoginScreenErrorState(error.toString()));
//     });
//
//   }


  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility(){
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(LoginScreenChangePasswordVisibility());
  }

}