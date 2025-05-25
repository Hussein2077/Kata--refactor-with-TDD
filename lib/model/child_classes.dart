import 'package:test_project/model/base_model/item.dart';

class Sulfuras extends Item {
  Sulfuras(int sellIn, int quality)
      : super(
            name: 'Sulfuras, Hand of Ragnaros',
            sellIn: sellIn,
            quality: quality);

  @override
  void updateQuality() {
    // Nothing
  }
}

class AgedBrie extends Item {
  AgedBrie(int sellIn, int quality)
      : super(name: 'Aged Brie', sellIn: sellIn, quality: quality);

  @override
  void updateQuality() {
    if (quality < 50) quality += 1;
    sellIn -= 1;
    if (sellIn < 0 && quality < 50) quality += 1;
  }
}

class BackstagePasses extends Item {
  BackstagePasses(int sellIn, int quality)
      : super(
            name: 'Backstage passes to a TAFKAL80ETC concert',
            sellIn: sellIn,
            quality: quality);

  @override
  void updateQuality() {
    if (quality < 50) {
      quality += 1;
      if (sellIn < 11 && quality < 50) quality += 1;

      if (sellIn < 6 && quality < 50) quality += 1;
    }
    sellIn -= 1;
    if (sellIn < 0) quality = 0;
  }
}

class ElixirOfTheMongoose extends Item {
  ElixirOfTheMongoose(int sellIn, int quality)
      : super(name: 'Elixir of the Mongoose', sellIn: sellIn, quality: quality);

  @override
  void updateQuality() {
    if (quality > 0) quality -= 1;
    sellIn -= 1;
    if (sellIn < 0) {
      if (quality > 0) quality -= 1;
    }
  }
}

class ConjuredManaCake extends Item {
  ConjuredManaCake(int sellIn, int quality)
      : super(name: 'Conjured Mana Cake', sellIn: sellIn, quality: quality);

  @override
  void updateQuality() {
    if (quality > 0) {
      quality -= 2;
    }

    sellIn -= 1;

    if (sellIn < 0) {
      if (quality > 0) {
        quality -= 1;
      }
    }
  }
}

class DexterityVest extends Item {
  DexterityVest(int sellIn, int quality)
      : super(name: '+5 Dexterity Vest', sellIn: sellIn, quality: quality);

  @override
  void updateQuality() {
    if (quality > 0) quality -= 1;
    sellIn -= 1;
    if (sellIn < 0)    (quality > 0)? quality -= 1: null;

  }
}
