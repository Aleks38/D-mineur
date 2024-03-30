import '../screens/ecran_grille.dart';

class Player {
  String name;
  DateTime date;
  int? score;
  int? time;
  Difficulty difficulty;

  Player({required this.name, required this.date, this.score, this.time, required this.difficulty});
}
