import 'dart:core';

import 'package:test_project/Tennis_game/tennis_game.dart';

abstract class ScoreStrategy {
  bool isApplicable(int player1, int player2);

  String getScore(
      int player1, int player2, String player1Name, String player2Name);
}

class DouceStrategy implements ScoreStrategy {
  @override
  bool isApplicable(int player1, int player2) =>
      player1 >= 3 && player1 == player2;

  @override
  String getScore(
          int player1, int player2, String player1Name, String player2Name) =>
      "Deuce";
}

class AdvantageStrategy implements ScoreStrategy {
  @override
  bool isApplicable(int player1, int player2) {
    int minusResult = player1 - player2;
    bool player1Advantage = minusResult == 1;
    bool player2Advantage = minusResult == -1;
    return (player1 >= 4 || player2 >= 4) &&
        (player2Advantage || player1Advantage);
  }

  @override
  String getScore(
          int player1, int player2, String player1Name, String player2Name) =>
      "Advantage ${player1 > player2 ? player1Name : player2Name}";
}

class WinStrategy implements ScoreStrategy {
  @override
  bool isApplicable(int player1, int player2) {
    return (player1 >= 4 || player2 >= 4) && (player1 - player2).abs() >= 2;
  }

  @override
  String getScore(
          int player1, int player2, String player1Name, String player2Name) =>
      "Win for ${player1 > player2 ? player1Name : player2Name}";
}

class NormalStrategy implements ScoreStrategy {
  final List<String> terms = ["Love", "Fifteen", "Thirty", "Forty"];

  @override
  bool isApplicable(int player1, int player2) =>
      player1 < 4 && player2 < 4 && player1 != player2;

  @override
  String getScore(
          int player1, int player2, String player1Name, String player2Name) =>
      "${terms[player1]}-${terms[player2]}";
}

class EqualScoreStrategy implements ScoreStrategy {
  final List<String> terms = ["Love-All", "Fifteen-All", "Thirty-All"];

  @override
  bool isApplicable(int player1, int player2) =>
      player1 == player2 && player1 < 3;

  @override
  String getScore(
          int player1, int player2, String player1Name, String player2Name) =>
      terms[player1];
}

class TennisGame1 implements TennisGame {
  int player1Score = 0;
  int player2Score = 0;
  final String _player1Name;
  final String _player2Name;

  TennisGame1(this._player1Name, this._player2Name);

  final List<ScoreStrategy> _scoreStrategies = [
    DouceStrategy(),
    AdvantageStrategy(),
    WinStrategy(),
    EqualScoreStrategy(),
    NormalStrategy(),
  ];

  @override
  void wonPoint(String playerName) {
    if (playerName == "player1") {
      player1Score += 1;
    } else {
      player2Score += 1;
    }
  }

  @override
  String getScore() {

    return _scoreStrategies
        .firstWhere(
          (element) => element.isApplicable(player1Score, player2Score),
        )
        .getScore(player1Score, player2Score, _player1Name, _player2Name);
  }
}
