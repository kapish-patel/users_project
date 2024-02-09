import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_project/User_repository.dart';
import 'package:users_project/user_form.dart';
import 'package:users_project/user_name.dart';
import 'package:users_project/user_provider.dart';
import 'package:users_project/user_data.dart';
import 'package:isar/user_isar.g.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final isar = await open([User]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:Scaffold(
          appBar: AppBar(
            title: const Text('User Form'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                UserForm(),
                const UserName(),
              ],
            )
          )
        ),
      ),
    );
  }
}
