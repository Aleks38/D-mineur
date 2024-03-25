import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tp02/riverpod/game/game_notifier.dart';
import 'package:tp02/screens/ecran_grille.dart';
import 'package:tp02/widgets/leader_board.dart';

class EcranAccueil extends ConsumerStatefulWidget {
  const EcranAccueil({super.key});

  @override
  ConsumerState<EcranAccueil> createState() => _EcranAccueilState();
}

class _EcranAccueilState extends ConsumerState<EcranAccueil> {
  // Contrôleur du champ texte "titre". Son attribut text contient le texte saisi
  final _pseudoController = TextEditingController();

  // La catégorie saisie dans le formulaire (modifiée par un DropdownButton)
  Difficulte _selectedDifficulty = Difficulte.values[0];

  // Validation des données du formulaire
  //  et soumission si données correctes
  void _submitExpenseData() {
    // Si le titre est vide, le montant non correct ou la date vide
    //  on montre un dialogue pour demander à l'utilisateur de corriger
    if (_pseudoController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Saisie Non Valide'),
          content: const Text('Vous devez saisir un titre, un montant, une date et une catégorie valides.'),
          actions: [
            TextButton(
              onPressed: () {
                // on dépile le dialogue de l'UI
                Navigator.pop(ctx);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Démineur - Choisir la difficulté"),
        automaticallyImplyLeading: false,
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
                    TextFormField(
                      controller: _pseudoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text('Pseudo'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        DropdownButton(
                          value: _selectedDifficulty,
                          items: Difficulte.values
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
                          onPressed: () {
                            ref.read(gameProvider.notifier).addPlayer(_pseudoController.text, DateTime.now());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EcranGrille(difficulte: _selectedDifficulty),
                              ),
                            );
                          },
                          child: const Text('Jouer'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 500,
            height: 500,
            child: LeaderBoard(),
          ),
        ],
      ),
    );
  }
}
