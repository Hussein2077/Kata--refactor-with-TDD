import 'package:test_project/GildedRose.dart';
import 'package:test_project/model/child_classes.dart';

main(List<String> args) {
  var items = [
     DexterityVest(10, 20),
     AgedBrie(2, 0),
    ElixirOfTheMongoose(5, 7),
     Sulfuras(0, 80),
     Sulfuras(-1, 80),
     BackstagePasses(15, 20),
     BackstagePasses(10, 49),
     BackstagePasses(5, 49),
     ConjuredManaCake(3, 6)
  ];

  GildedRose app =   GildedRose(items);

  int days = 2;
  if (args.isNotEmpty) {
    days = int.parse(args[0]) + 1;
  }

  for (int i = 0; i < days; i++) {
    print("-------- day $i --------");
    print("name, sellIn, quality");
    for (var item in items) {
      print(item);
    }
    print('');
    app.updateQuality();
  }
}
