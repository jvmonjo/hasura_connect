import 'package:flutter/material.dart';
import 'package:hasura_chat/src/app_bloc.dart';
import 'package:hasura_chat/src/app_module.dart';
import 'package:hasura_chat/src/home/home_module.dart';
import 'package:hasura_chat/src/login/login_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = AppModule.to.bloc<AppBloc>();

    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
        stream: bloc.userController,
        builder: (context, snapshot) {
          print(snapshot.data);
          return snapshot.hasData ? HomeModule() : LoginModule();
        },
      ),
    );
  }
}
