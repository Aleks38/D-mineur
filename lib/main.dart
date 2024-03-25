import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp02/firebase_options.dart';
import 'package:tp02/screens/ecran_acceuil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: DemineurApp()));
}

class DemineurApp extends StatelessWidget {
  const DemineurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Démineur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EcranAccueil(),
    );
  }
}
