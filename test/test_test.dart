import 'package:test/test.dart';
import 'package:test_project/GildedRose.dart';
import 'package:test_project/model/base_model/item.dart';
import 'package:test_project/model/child_classes.dart';
import 'package:test_project/test.dart';
void main() {
  group('GildedRose', () {
    test('Normal item decreases quality and sellIn', () {
      var items = [DexterityVest(10, 20)];
      var app = GildedRose(items);
      app.updateQuality();
      expect(items[0].sellIn, 9);
      expect(items[0].quality, 19);
    });

    test('Aged Brie increases quality', () {
      var items = [AgedBrie (  2, 0)];
      var app = GildedRose(items);
      app.updateQuality();
      expect(items[0].sellIn, 1);
      expect(items[0].quality, 1);
    });

    test('Sulfuras does not change', () {
      var items = [Sulfuras ( 0, 80)];
      var app = GildedRose(items);
      app.updateQuality();
      expect(items[0].sellIn, 0);
      expect(items[0].quality, 80);
    });

    test('Backstage passes increase quality based on sellIn', () {
      var items = [BackstagePasses ( 15, 20)];
      var app = GildedRose(items);
      app.updateQuality();
      expect(items[0].sellIn, 14);
      expect(items[0].quality, 21);
    });

    test('Conjured item decreases quality twice as fast', () {
      var items = [   ConjuredManaCake(  3, 6)];
      var app = GildedRose(items);
      app.updateQuality();
      expect(items[0].sellIn, 2);
      expect(items[0].quality, 4); // Assuming correct behavior
    });
  });
}