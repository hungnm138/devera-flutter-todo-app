import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/models/todo.dart';
import 'package:to_do_app/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';

import 'config/firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Hive
    ..initFlutter()
    ..init((await getApplicationSupportDirectory()).path)
    ..registerAdapter(TodoAdapter());

  await Hive.openBox<Todo>('todos');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
