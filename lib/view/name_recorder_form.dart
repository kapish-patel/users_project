import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_project/view_model/names_provider.dart';

class NameRecorderForm extends StatelessWidget {
  NameRecorderForm({Key? key}) : super(key: key);

  //controller
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          child: TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Enter your name',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<NamesProvider>().addName(_nameController.text);
            _nameController.clear();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
