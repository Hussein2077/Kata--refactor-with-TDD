import 'package:test/test.dart';
import 'package:test_project/GildedRose.dart';
import 'package:test_project/model/base_model/item.dart';
import 'package:test_project/model/GildedRose_child_classes.dart';
import 'package:test_project/parrot.dart';
import 'package:test_project/parrot_type.dart';
import 'package:test_project/test.dart';
void main() {
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
  group('Parrot', () {
    test('Speed of European Parrot', () {
      final parrot = Parrot(ParrotType.european,
          numberOfCoconuts: 0, voltage: 0.0, isNailed: false);
      expect(parrot.speed(), equals(12.0));
    });

    test('Speed of African Parrot with one coconut', () {
      final parrot = Parrot(ParrotType.african,
          numberOfCoconuts: 1, voltage: 0.0, isNailed: false);
      expect(parrot.speed(), equals(3.0));
    });

    test('Speed of African Parrot with two coconuts', () {
      final parrot = Parrot(ParrotType.african,
          numberOfCoconuts: 2, voltage: 0.0, isNailed: false);
      expect(parrot.speed(), equals(0.0));
    });

    test('Speed of African Parrot with no coconuts', () {
      final parrot = Parrot(ParrotType.african,
          numberOfCoconuts: 0, voltage: 0.0, isNailed: false);
      expect(parrot.speed(), equals(12.0));
    });

    test('Speed of Norwegian Blue Parrot nailed', () {
      final parrot = Parrot(ParrotType.norwegianBlue,
          numberOfCoconuts: 0, voltage: 0.0, isNailed: true);
      expect(parrot.speed(), equals(0.0));
    });

    test('Speed of Norwegian Blue Parrot not nailed', () {
      final parrot = Parrot(ParrotType.norwegianBlue,
          numberOfCoconuts: 0, voltage: 1.5, isNailed: false);
      expect(parrot.speed(), equals(18.0));
    });

    test('Speed of Norwegian Blue Parrot not nailed high voltage', () {
      final parrot = Parrot(ParrotType.norwegianBlue,
          numberOfCoconuts: 0, voltage: 4.0, isNailed: false);
      expect(parrot.speed(), equals(24.0));
    });
  });
}