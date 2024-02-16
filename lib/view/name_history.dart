import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_project/view_model/names_provider.dart';

class NameHistory extends StatelessWidget {
  const NameHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: context.watch<NamesProvider>().names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(context.watch<NamesProvider>().names[index].name,)
          );
        },
      ),
    );
  }
}
