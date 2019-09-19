import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:hasura_chat/src/app_bloc.dart';
import 'package:hasura_chat/src/app_module.dart';
import 'package:hasura_chat/src/app_repository.dart';

class LoginBloc extends BlocBase {
  final AppRepository repository;
  final appBloc = AppModule.to.bloc<AppBloc>();

  var controller = TextEditingController();

  LoginBloc(this.repository);

  Future<bool> login() async {
    try {
      var user = await repository.getUser(controller.text);
      print("Logou...");
      print(user.toJson());
      appBloc.userController.add(user);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
