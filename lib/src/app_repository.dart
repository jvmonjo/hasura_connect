import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:hasura_chat/src/models/user_model.dart';
import 'package:hasura_connect/hasura_connect.dart';

class AppRepository extends Disposable {
  final HasuraConnect connection;

  AppRepository(this.connection);

  Future<UserModel> getUser(String user) async {
    var query = """
      getUser(\$name:String!){
        users(where: {name: {_eq: \$name}}) {
          name
          id
        }
      }
    """;

    var data = await connection.query(query, variables: {"name": user});
    if (data["data"]["users"].isEmpty) {
      return createUser(user);
    }

    return UserModel.fromJson(data["data"]["users"][0]);
  }

  Future<UserModel> createUser(String user) async {
    var query = """
      createUser(\$name:String!) {
        insert_users(objects: {name: \$name}) {
          returning {
            id
          }
        }
      }
    """;

    var data = await connection.mutation(query, variables: {"name": user});
    var id = data["data"]["insert_users"]["returning"][0]["id"];

    return UserModel(id: id, name: user);
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {}
}
