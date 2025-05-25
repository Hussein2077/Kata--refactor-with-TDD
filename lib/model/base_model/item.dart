abstract class Item {
  String name;
  int sellIn;
  int quality;

  Item({required this.name, required this.sellIn, required this.quality});
  void updateQuality();
  @override
  String toString() => '$name, $sellIn, $quality';
}