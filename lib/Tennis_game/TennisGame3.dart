import 'dart:core';

import 'package:test_project/Tennis_game/tennis_game.dart';

class TennisGame3 implements TennisGame {
  int _player1Score = 0;
  int _player2Score = 0;
  final String _player1Name;
  final String _player2Name;

  TennisGame3(this._player1Name, this._player2Name);

  static const List<String> scoreTerms = ["Love", "Fifteen", "Thirty", "Forty"];

  String getScore() {
    if (isEarlyGame()) {
      return _player1Score == _player2Score
          ? "${scoreTerms[_player1Score]}-All"
          : "${scoreTerms[_player1Score]}-${scoreTerms[_player2Score]}";
    }

    if (_player1Score == _player2Score) return "Deuce";

    final leadingPlayer =
        _player1Score > _player2Score ? _player1Name : _player2Name;

    final scoreDiff = (_player1Score - _player2Score).abs();

    if (scoreDiff == 1) return "Advantage $leadingPlayer";
    return "Win for $leadingPlayer";
  }
  bool isEarlyGame() {
    return _player1Score < 4 && _player2Score < 4 && (_player1Score + _player2Score != 6);
  }
  void wonPoint(String playerName) {
    if (playerName == "player1") {
      _player1Score+= 1;
    } else {
      _player2Score += 1;
    }
  }
}
