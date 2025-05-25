import 'package:test_project/model/GildedRose_child_classes.dart';
import 'package:test_project/model/base_model/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items){
    items=items.map((e) =>   _createItem(e.name, e.sellIn, e.quality)).toList();
  }
Item _createItem(String name, int sellIn, int quality) {
  switch (name) {
    case "Aged Brie":
      return AgedBrie(sellIn, quality);
    case "Backstage passes to a TAFKAL80ETC concert":
      return BackstagePasses(sellIn, quality);
    case "Conjured Mana Cake":
      return ConjuredManaCake(sellIn, quality);
    case "Sulfuras, Hand of Ragnaros":
      return Sulfuras(sellIn, quality);
    case "Elixir of the Mongoose":
      return ElixirOfTheMongoose(sellIn, quality);
    case "Dexterity Vest":
      return DexterityVest(sellIn, quality);
    default:
      return NormalItem(name: name, sellIn: sellIn, quality: quality);
  }
}
  void updateQuality() {
    for (var item in items) {
    item.updateQuality();
    }
  }
}



