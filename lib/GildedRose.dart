import 'package:test_project/model/base_model/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  void updateQuality() {
    for (var item in items) {
    item.updateQuality();
    }
  }
}



