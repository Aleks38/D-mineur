import 'dart:math';

import 'case.dart';
import 'coup.dart';

/// [Grille] de démineur
class Grille {
  /// Dimension de la grille carrée : [taille]x[taille]
  final int taille;

  /// Nombre de mines présentes dans la grille
  final int nbMines;

  /// Attribut privé (_), liste composée [taille] listes de chacune [taille] cases
  final List<List<Case>> _grille = [];

  /// Construit une [Grille] comportant [taille] lignes, [taille] colonnes et [nbMines] mines
  Grille({required this.taille, required this.nbMines}) {
    int nbCasesACreer = nbCases; // Le nombre de cases qu'il reste à créer
    int nbMinesAPoser = nbMines; // Le nombre de mines qu'il reste à poser
    Random generateur = Random(); // Générateur de nombres aléatoires
    // Pour chaque ligne de la grille
    for (int lig = 0; lig < taille; lig++) {
      // On va ajouter à la grille une nouvelle Ligne (liste de 'cases')
      List<Case> uneLigne = []; //
      for (int col = 0; col < taille; col++) {
        // S'il reste nBMinesAPoser dans nbCasesACreer, la probabilité de miner est nbMinesAPoser/nbCasesACreer
        // Donc on tire un nombre aléatoire a dans [1..nbCasesACreer] et on pose une mine si a <= nbMinesAposer
        bool isMinee = generateur.nextInt(nbCasesACreer) < nbMinesAPoser;
        if (isMinee) nbMinesAPoser--; // une mine de moins à poser
        uneLigne.add(Case(isMinee)); // On ajoute une nouvelle case à la ligne
        nbCasesACreer--; // Une case de moins à créer
      }
      // On ajoute la nouvelle ligne à la grille
      _grille.add(uneLigne);
    }
    // Les cases étant créées et les mines posées, on calcule pour chaque case le 'nombre de mines autour'
    calculeNbMinesAutour();
  }

  /// Getter qui retourne le nombre de cases
  int get nbCases => taille * taille;

  /// Retourne la [Case] de la [Grille] située à [coord]
  Case getCase(Coordonnees coord) {
    return _grille[coord.ligne][coord.colonne];
  }

  /// Retourne la liste des [Coordonnees] des voisines de la case située à [coord]
  List<Coordonnees> getVoisines(Coordonnees coord) {
    List<Coordonnees> listeVoisines = [];

    int ligne = coord.ligne;
    int colonne = coord.colonne;

    for (int i = ligne - 1; i < ligne + 2; i++) {
      if (i >= 0 && i < taille) {
        for (int j = colonne - 1; j < colonne + 2; j++) {
          if (j >= 0 && j < taille) {
            Coordonnees point = (ligne: i, colonne: j);
            listeVoisines.add(point);
          }
        }
      }
    }
    return listeVoisines;
  }

  /// Assigne à chaque [Case] le nombre de mines présentes dans ses voisines
  void calculeNbMinesAutour() {
    for (int lig = 0; lig < taille; lig++) {
      for (int col = 0; col < taille; col++) {
        _grille[lig][col].nbMinesAutour = 0;
        Coordonnees coord = (ligne: lig, colonne: col);
        List<Coordonnees> listVoisine = getVoisines(coord);
        for (Coordonnees laVoisine in listVoisine) {
          Case laCase = getCase(laVoisine);
          if (laCase.minee) {
            _grille[lig][col].nbMinesAutour += 1;
          }
        }
      }
    }
  }

  /// - Découvre récursivement toutes les cases voisines d'une case située à [coord]
  /// - La case située à [coord] doit être découverte
  void decouvrirVoisines(Coordonnees coord) {
    Case maCase = getCase(coord);
    maCase.decouvrir();

    if (maCase.nbMinesAutour == 0) {
      List<Coordonnees> listVoisine = getVoisines(coord);
      for (Coordonnees laVoisine in listVoisine) {
        Case maCase = getCase(laVoisine);
        if (maCase.etat == Etat.couverte) {
          decouvrirVoisines(laVoisine);
        }
      }
    }
  }

  /// Met à jour la Grille en fonction du [coup] joué
  void mettreAJour(Coup coup) {
    Case laCase = getCase(coup.coordonnees);

    if (coup.action == ActionCase.marquer) {
      laCase.inverserMarque();
    }

    if (coup.action == ActionCase.decouvrir) {
      if (laCase.etat == Etat.couverte) {
        decouvrirVoisines(coup.coordonnees);
      }
    }

    if (coup.action == ActionCase.montrer) {
      if (laCase.etat == Etat.couverte) {
        laCase.etat = Etat.afficher;
      }
    }
  }

  /// Renvoie vrai si [Grille] ne comporte que des cases soit minées soit découvertes (mais pas les 2)
  bool isGagnee() {
    return _grille.every((ligne) => ligne.every((aCase) => aCase.etat == Etat.decouverte || aCase.minee));
  }

  /// Renvoie vrai si [Grille] comporte au moins une case minée et découverte
  bool isPerdue() {
    for (List<Case> aLigne in _grille) {
      for (Case aCase in aLigne) {
        if (aCase.etat == Etat.decouverte && aCase.minee) {
          return true;
        }
      }
    }

    return false;
  }

  // Renvoie vrai si la partie est finie, gagnée ou perdue
  bool isFinie() {
    if (isGagnee() || isPerdue()) {
      return true;
    } else {
      return false;
    }
  }

  void afficherGrille() {}
}
