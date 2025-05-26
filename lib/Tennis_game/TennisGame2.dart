
import 'dart:core';

import 'package:test_project/Tennis_game/tennis_game.dart';
abstract class ScoreStrategy {
  bool isApplicable(int p1, int p2);
  String getScore(int p1, int p2, String p1Name, String p2Name);
}
class DeuceStrategy implements ScoreStrategy {
  @override
  bool isApplicable(int p1, int p2) => p1 >= 3 && p1 == p2;

  @override
  String getScore(int p1, int p2, String p1Name, String p2Name) => "Deuce";
}

class EqualScoreStrategy implements ScoreStrategy {
  final List<String> terms = ["Love-All", "Fifteen-All", "Thirty-All"];

  @override
  bool isApplicable(int p1, int p2) => p1 == p2 && p1 < 3;

  @override
  String getScore(int p1, int p2, String p1Name, String p2Name) =>
      terms[p1];
}

class AdvantageStrategy implements ScoreStrategy {
  @override
  bool isApplicable(int p1, int p2) =>
      (p1 >= 4 || p2 >= 4) && (p1 - p2).abs() == 1;

  @override
  String getScore(int p1, int p2, String p1Name, String p2Name) =>
      "Advantage ${p1 > p2 ? p1Name : p2Name}";
}

class WinStrategy implements ScoreStrategy {
  @override
  bool isApplicable(int p1, int p2) =>
      (p1 >= 4 || p2 >= 4) && (p1 - p2).abs() >= 2;

  @override
  String getScore(int p1, int p2, String p1Name, String p2Name) =>
      "Win for ${p1 > p2 ? p1Name : p2Name}";
}

class NormalScoreStrategy implements ScoreStrategy {
  final List<String> terms = ["Love", "Fifteen", "Thirty", "Forty"];

  @override
  bool isApplicable(int p1, int p2) => true;

  @override
  String getScore(int p1, int p2, String p1Name, String p2Name) =>
      "${terms[p1]}-${terms[p2]}";
}


class TennisGame2 implements TennisGame {
  int P1point = 0;
  int P2point = 0;
  final String _player1Name;
  final String _player2Name;

  TennisGame2(this._player1Name, this._player2Name);

  final List<ScoreStrategy> strategies = [
    DeuceStrategy(),
    EqualScoreStrategy(),
    AdvantageStrategy(),
    WinStrategy(),
    NormalScoreStrategy(),
  ];

  @override
  String getScore() {
    return strategies
        .firstWhere((s) => s.isApplicable(P1point, P2point))
        .getScore(P1point, P2point, _player1Name, _player2Name);
  }

  @override
  void wonPoint(String player) {
    if (player == "player1") {
      P1point++;
    } else {
      P2point++;
    }
  }
}
