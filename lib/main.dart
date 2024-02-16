import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:users_project/model/db_connection.dart';
import 'package:users_project/model/name_isar.dart';
import 'package:users_project/model/names_repository.dart';
import 'package:users_project/view/name_recorder_form.dart';
import 'package:users_project/view/name_history.dart';
import 'package:users_project/view_model/names_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.init();
  final isar = Database.isar;
  runApp(MyApp(isar: isar));
}

class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NamesProvider(NamesRepository(isar.nameIsars))),
        ],
        child:const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NameRecorderForm(),
            FutureBuilder(
              future: Provider.of<NamesProvider>(context, listen: false).getNames(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return const NameHistory();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}