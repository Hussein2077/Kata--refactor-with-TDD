import 'package:test_project/model/base_model/item.dart';

class Sulfuras extends Item {
  Sulfuras( int sellIn, int quality) : super(name: 'Sulfuras, Hand of Ragnaros', sellIn: sellIn, quality: quality);
  @override
  void updateQuality() {}
}
class AgedBrie extends Item {
  AgedBrie(int sellIn, int quality) : super(name: 'Aged Brie', sellIn: sellIn, quality: quality);
  @override
  void updateQuality() {}
}
class BackstagePasses extends Item {
  BackstagePasses(int sellIn, int quality) : super(name: 'Backstage passes to a TAFKAL80ETC concert', sellIn: sellIn, quality: quality);
  @override
  void updateQuality() {}
}
//Elixir of the Mongoose
class  ElixirOfTheMongoose extends Item {
  ElixirOfTheMongoose(int sellIn, int quality) : super(name: 'Elixir of the Mongoose', sellIn: sellIn, quality: quality);
  @override
  void updateQuality() {}
}
//Conjured Mana Cake
class ConjuredManaCake extends Item {
  ConjuredManaCake(int sellIn, int quality) : super(name: 'Conjured Mana Cake', sellIn: sellIn, quality: quality);
  @override
  void updateQuality() {}
}
//+5 Dexterity Vest
class DexterityVest extends Item {
  DexterityVest(int sellIn, int quality) : super(name: '+5 Dexterity Vest', sellIn: sellIn, quality: quality);
  @override
  void updateQuality() {}
}