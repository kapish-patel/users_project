import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_project/user_provider.dart';

class UserForm extends StatelessWidget {
  UserForm({Key? key}) : super(key: key);

  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children:[
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
              border: OutlineInputBorder(),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).addUsername(_usernameController.text);
              _usernameController.clear();
            },
            child: const Text('Submit'),
          ),
        ]
      )
    );    
  }
}