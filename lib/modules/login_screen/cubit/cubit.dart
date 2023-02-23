import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:convert';

import 'package:solar_system_team/modules/login_screen/cubit/states.dart';

import '../../../models/model_login_screen.dart';
import '../../../shared/const/const.dart';
import '../../../shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  void changePasswordStatus() {
    if (obscureText == true) {
      obscureText = false;
    } else {
      obscureText = true;
    }
    emit(ChangeIconSifForPasswordState());
  }

  late LoginScreenModel login;
  Map<String, dynamic>? loginError;
  void userLogIn({
    required String email,
    required String password,
  }) {
    DioHelper.postData(url: "$endPoint/login", data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      login = LoginScreenModel.fromJson(value.data);
      // print(login.data!.token!.token);
      emit(LoginSuccessState(login));
    }).catchError((error) {
      String? message;
      print(error.toString());
      if (error is DioError) {
        message = error.response!.data['data'];
        // print(error.response!.data['data']);
        // print(error.message);
      }
      // final body = json.decode(onError.data.toString());
      //  print(error.toString());
      // message = 'hjghghghghfggfgfgf';
      emit(LoginErrorState(error.toString(), message));
    });
  }
}
