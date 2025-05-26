import 'dart:math';

import 'package:test/test.dart';
import 'package:test_project/GildedRose.dart';
import 'package:test_project/Tennis_game/TennisGame1.dart';
import 'package:test_project/Tennis_game/TennisGame2.dart';
import 'package:test_project/Tennis_game/TennisGame3.dart';
import 'package:test_project/Tennis_game/tennis_game.dart';
import 'package:test_project/model/base_model/item.dart';
import 'package:test_project/model/GildedRose_child_classes.dart';
import 'package:test_project/parrot.dart';
import 'package:test_project/parrot_type.dart';
import 'package:test_project/test.dart';
void main() {
  var allScores = [
    TennisTest(0, 0, "Love-All"),
    TennisTest(1, 1, "Fifteen-All"),
    TennisTest(2, 2, "Thirty-All"),
    TennisTest(3, 3, "Deuce"),
    TennisTest(4, 4, "Deuce"),
    TennisTest(1, 0, "Fifteen-Love"),
    TennisTest(0, 1, "Love-Fifteen"),
    TennisTest(2, 0, "Thirty-Love"),
    TennisTest(0, 2, "Love-Thirty"),
    TennisTest(3, 0, "Forty-Love"),
    TennisTest(0, 3, "Love-Forty"),
    TennisTest(4, 0, "Win for player1"),
    TennisTest(0, 4, "Win for player2"),
    TennisTest(2, 1, "Thirty-Fifteen"),
    TennisTest(1, 2, "Fifteen-Thirty"),
    TennisTest(3, 1, "Forty-Fifteen"),
    TennisTest(1, 3, "Fifteen-Forty"),
    TennisTest(4, 1, "Win for player1"),
    TennisTest(1, 4, "Win for player2"),
    TennisTest(3, 2, "Forty-Thirty"),
    TennisTest(2, 3, "Thirty-Forty"),
    TennisTest(4, 2, "Win for player1"),
    TennisTest(2, 4, "Win for player2"),
    TennisTest(4, 3, "Advantage player1"),
    TennisTest(3, 4, "Advantage player2"),
    TennisTest(5, 4, "Advantage player1"),
    TennisTest(4, 5, "Advantage player2"),
    TennisTest(15, 14, "Advantage player1"),
    TennisTest(14, 15, "Advantage player2"),
    TennisTest(6, 4, "Win for player1"),
    TennisTest(4, 6, "Win for player2"),
    TennisTest(16, 14, "Win for player1"),
    TennisTest(14, 16, "Win for player2"),
  ];

  void checkAllScores(TennisGame game, TennisTest test) {
    int highestScore = max(test.player1Score, test.player2Score);
    for (int i = 0; i < highestScore; i++) {
      if (i < test.player1Score) game.wonPoint("player1");
      if (i < test.player2Score) game.wonPoint("player2");
    }
    expect(game.getScore(), test.expectedScore);
  }

  group('checkAllScoresTennisGame1', () {
    for (var tested in allScores) {
      test('${tested.player1Score} - ${tested.player2Score} - ${tested.expectedScore}', () {
        TennisGame1 game =   TennisGame1("player1", "player2");
        checkAllScores(game, tested);
      });
    }
  });

  group('checkAllScoresTennisGame2', () {
    for (var tested in allScores) {
      test('${tested.player1Score} - ${tested.player2Score} - ${tested.expectedScore}', () {
        TennisGame2 game =   TennisGame2("player1", "player2");
        checkAllScores(game, tested);
      });
    }
  });

  group('checkAllScoresTennisGame3', () {
    for (var tested in allScores) {
      test('${tested.player1Score} - ${tested.player2Score} - ${tested.expectedScore}', () {
        TennisGame3 game =   TennisGame3("player1", "player2");
        checkAllScores(game, tested);
      });
    }
  });
  // group('Parrot', () {
  //   test('Speed of European Parrot', () {
  //     final parrot = EuropeanParrot(
  //     );
  //     expect(parrot.speed(), equals(12.0));
  //   });
  //
  //   test('Speed of African Parrot with one coconut', () {
  //     final parrot = AfricanParrot(
  //         numberOfCoconuts: 1, );
  //     expect(parrot.speed(), equals(3.0));
  //   });
  //
  //   test('Speed of African Parrot with two coconuts', () {
  //     final parrot = AfricanParrot(
  //         numberOfCoconuts: 2,  );
  //     expect(parrot.speed(), equals(0.0));
  //   });
  //
  //   test('Speed of African Parrot with no coconuts', () {
  //     final parrot = AfricanParrot(
  //         numberOfCoconuts: 0,  );
  //     expect(parrot.speed(), equals(12.0));
  //   });
  //
  //   test('Speed of Norwegian Blue Parrot nailed', () {
  //     final parrot = NorwegianBlueParrot(
  //         voltage: 0.0, isNailed: true);
  //     expect(parrot.speed(), equals(0.0));
  //   });
  //
  //   test('Speed of Norwegian Blue Parrot not nailed', () {
  //     final parrot = NorwegianBlueParrot(
  //  voltage: 1.5, isNailed: false);
  //     expect(parrot.speed(), equals(18.0));
  //   });
  //
  //   test('Speed of Norwegian Blue Parrot not nailed high voltage', () {
  //     final parrot = NorwegianBlueParrot(
  //     voltage: 4.0, isNailed: false);
  //     expect(parrot.speed(), equals(24.0));
  //   });
  //   test('Factory creates correct parrot type', () {
  //     final parrot = ParrotFactory.create(ParrotType.african, numberOfCoconuts: 2);
  //     expect(parrot, isA<AfricanParrot>());
  //     expect(parrot.speed(), equals(0.0));
  //   });
  //
  // });
  // group('GildedRose', () {
  //   test('Normal item decreases quality and sellIn', () {
  //     var items = [ DexterityVest(10, 20)];
  //     var app = GildedRose(items);
  //     app.updateQuality();
  //     expect(items[0].sellIn, 9);
  //     expect(items[0].quality, 19);
  //   });
  //
  //   test('Aged Brie increases quality', () {
  //     var items = [AgedBrie (  2, 0)];
  //     var app = GildedRose(items);
  //     app.updateQuality();
  //     expect(items[0].sellIn, 1);
  //     expect(items[0].quality, 1);
  //   });
  //
  //   test('Sulfuras does not change', () {
  //     var items = [Sulfuras ( 0, 80)];
  //     var app = GildedRose(items);
  //     app.updateQuality();
  //     expect(items[0].sellIn, 0);
  //     expect(items[0].quality, 80);
  //   });
  //
  //   test('Backstage passes increase quality based on sellIn', () {
  //     var items = [BackstagePasses ( 15, 20)];
  //     var app = GildedRose(items);
  //     app.updateQuality();
  //     expect(items[0].sellIn, 14);
  //     expect(items[0].quality, 21);
  //   });
  //
  //   test('Conjured item decreases quality twice as fast', () {
  //     var items = [   ConjuredManaCake(  3, 6)];
  //     var app = GildedRose(items);
  //     app.updateQuality();
  //     expect(items[0].sellIn, 2);
  //     expect(items[0].quality, 4);
  //   });
  // });

}
class TennisTest {
  int player1Score;
  int player2Score;
  String expectedScore;

  TennisTest(this.player1Score, this.player2Score, this.expectedScore) {}
}