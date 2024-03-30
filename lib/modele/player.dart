import '../screens/ecran_grille.dart';

class Player {
  String? name;
  DateTime date;
  int? score;
  int? time;
  Difficulty difficulty;

  Player({this.name, required this.date, this.score, this.time, required this.difficulty});
}

class PlayerList {
  final List<Player> playerHistory = [
    Player(name: "Alexy", date: DateTime.now(), score: 8, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 0, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 2, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 10, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 19, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 4, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20, difficulty: Difficulty.difficile),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20, difficulty: Difficulty.difficile),
  ];

  List<Player> get list => playerHistory;

  void addItem(Player item) {
    playerHistory.add(item);
  }

  void removeItem(Player item) {
    playerHistory.remove(item);
  }

  void clearList() {
    playerHistory.clear();
  }

  void sortByDate() {
    playerHistory.sort((a, b) => b.date.compareTo(a.date));
  }

  void sortByScore() {
    playerHistory.sort((a, b) => b.score!.compareTo(a.score as num));
  }

  void updatePlayer(int score, int time) {
    playerHistory.first.score = score;
    playerHistory.first.time = time;
  }
}
