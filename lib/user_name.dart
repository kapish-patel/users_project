// UserName is a StatelessWidget that displays the username.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_project/user_provider.dart';

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, UserProvider userProvider, child) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: userProvider.username.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userProvider.username[index]),
          );
        },
      );
    });
  }
}