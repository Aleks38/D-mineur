import 'case.dart';

/// [ActionCase] qu'on peut jouer sur une [Case]
enum ActionCase { decouvrir, marquer, montrer }

/// [Coup] joué
class Coup {
  Coordonnees coordonnees;
  ActionCase action;

  Coup(int lig, int col, this.action) : coordonnees = (ligne: lig, colonne: col);
}
