import 'package:flutter/material.dart';
import 'package:hasura_chat/src/login/login_bloc.dart';
import 'package:hasura_chat/src/login/login_module.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bloc = LoginModule.to.bloc<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: bloc.controller,
              decoration: InputDecoration(
                labelText: "NickName",
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("Acessar"),
              onPressed: () {
                bloc.login();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
