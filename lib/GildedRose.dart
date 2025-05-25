import 'package:test_project/model/base_model/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  void updateQuality() {
    for (var item in items) {
      bool isSulfuras = item.name == "Sulfuras, Hand of Ragnaros";
      bool isAgedBrie = item.name == "Aged Brie";
      bool isBackstage =
          item.name == "Backstage passes to a TAFKAL80ETC concert";
      if (!isAgedBrie && !isBackstage) {
        if (item.quality > 0 && !isSulfuras) {
          item.quality -= 1;
        }
      } else {
        if (item.quality < 50) {
          item.quality += 1;

          if (isBackstage) {
            if (item.sellIn < 11 && item.quality < 50) {
              item.quality += 1;
            }

            if (item.sellIn < 6 && item.quality < 50) {
              item.quality += 1;
            }
          }
        }
      }

      if (!isSulfuras) {
        item.sellIn -= 1;
      }

      if (item.sellIn < 0) {
        if (!isAgedBrie) {
          if (!isBackstage) {
            if (item.quality > 0) {
              if (!isSulfuras) {
                item.quality -= 1;
              }
            }
          } else {
            item.quality = 0;
          }
        } else {
          if (item.quality < 50) {
            item.quality += 1;
          }
        }
      }
    }
  }
}



