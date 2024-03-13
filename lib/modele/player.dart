class Player {
  String name;
  DateTime date;
  int? score;
  int? time;

  Player({required this.name, required this.date, this.score, this.time});
}

class PlayerList {
  static final PlayerList _instance = PlayerList._internal();

  factory PlayerList() {
    return _instance;
  }

  PlayerList._internal();

  final List<Player> _players = [
    Player(name: "Alexy", date: DateTime.now(), score: 8, time: 20),
    Player(name: "Alexy", date: DateTime.now(), score: 0, time: 20),
    Player(name: "Alexy", date: DateTime.now(), score: 2, time: 20),
    Player(name: "Alexy", date: DateTime.now(), score: 10, time: 20),
    Player(name: "Alexy", date: DateTime.now(), score: 19, time: 20),
    Player(name: "Alexy", date: DateTime.now(), score: 4, time: 20),
    Player(name: "Alexy", date: DateTime.now(), score: 1, time: 20),
  ];

  List<Player> get list => _players;

  void addItem(Player item) {
    _players.add(item);
  }

  void removeItem(Player item) {
    _players.remove(item);
  }

  void clearList() {
    _players.clear();
  }

  void sortByDate() {
    _players.sort((a, b) => b.date.compareTo(a.date));
  }

  void sortByScore() {
    _players.sort((a, b) => b.score!.compareTo(a.score as num));
  }

  void updatePlayer(int score, int time) {
    _players.first.score = score;
    _players.first.time = time;
  }
}
