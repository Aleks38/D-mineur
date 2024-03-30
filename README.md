# Démineur - Da Silva Alexy A11

Ce projet consiste en la réalisation d'un **Démineur** version web avec l'utilisation du framework **Flutter**.

## Packages

- Firebase Auth
- Firestore
- Riverpod
- INTL
- Stop watch timer

## Getting Started

`git clone https://github.com/Aleks38/Demineur.git`

### Prerequisites

- Version de **Flutter** : 3.19.2
- Version de **Dart** : 3.3.0

### Start

1. Récupérer et installer les dépendances :\
   `flutter pub get`
2. Exécuter les générateurs de code :\
   `flutter pub run build_runner build --delete-conflicting-outputs`
3. Choisir un device web
4. Lancer le projet

## Functionalities

### Authentification

Une authentification obligatoire a été mise en place pour accéder au démineur. Cette authentification a été réalisée avec **Firebase
Authentication**.

### Leaderboard

Un leaderboard global est affiché sur l'écran d'accueil. Il a été fait grâce à une base de données Firestore.

### Difficulty level

Il y a la possibilité de choisir la difficulté du démineur au lancement de chaque partie.