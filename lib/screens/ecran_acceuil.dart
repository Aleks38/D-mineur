import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp02/screens/ecran_grille.dart';
import 'package:tp02/widgets/history.dart';
import 'package:tp02/widgets/leader_board.dart';

import '../riverpod/game/game_notifier.dart';

class EcranAccueil extends ConsumerStatefulWidget {
  const EcranAccueil({super.key});

  @override
  ConsumerState<EcranAccueil> createState() => _EcranAccueilState();
}

class _EcranAccueilState extends ConsumerState<EcranAccueil> {
  Difficulty _selectedDifficulty = Difficulty.values[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Démineur - Choisir la difficulté"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
          const SignOutButton(),
        ],
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 650,
                      child: Text(
                        'Pour apparaître dans le LeaderBoard, ajoutez-vous un pseudo dans la rubrique "Mon compte" en haut à droite de votre écran.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                    Row(
                      children: [
                        DropdownButton(
                          value: _selectedDifficulty,
                          items: Difficulty.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category.name.toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedDifficulty = value;
                              });
                            }
                          },
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () async {
                            ref
                                .read(gameProvider.notifier)
                                .addPlayer(FirebaseAuth.instance.currentUser?.displayName, DateTime.now(), _selectedDifficulty);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EcranGrille(difficulty: _selectedDifficulty),
                              ),
                            );
                          },
                          child: const Text('Jouer'),
                        ),
                      ],
                    ),
                    const History()
                  ],
                ),
              ),
            ),
          ),
          const LeaderBoard(),
        ],
      ),
    );
  }
}
