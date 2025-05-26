import 'dart:math';
import 'package:test_project/parrot_type.dart';

abstract class BaseParrot {
  double speed();
}

class EuropeanParrot extends BaseParrot {
  @override
  double speed() => 12.0;

  EuropeanParrot();
}

class AfricanParrot extends BaseParrot {
  int numberOfCoconuts;

  @override
  double speed() {

    return max(0, 12.0 - 9.0* numberOfCoconuts);
  }

  AfricanParrot({
    required this.numberOfCoconuts,
  });
}
class NorwegianBlueParrot extends BaseParrot {
  bool isNailed;
  double voltage;
  double _baseSpeed(double voltage) {
    return min(24.0, voltage * 12.0);
  }
  @override
  double speed() {
    if (isNailed) return 0.0;

    return _baseSpeed(voltage);
  }

  NorwegianBlueParrot({
    required this.isNailed,
    required this.voltage,
  });
}

class ParrotFactory {
  static BaseParrot create(ParrotType type,
      {int numberOfCoconuts = 0,
        double voltage = 0.0,
        bool isNailed = false}) {
    switch (type) {
      case ParrotType.european:
        return EuropeanParrot();
      case ParrotType.african:
        return AfricanParrot(numberOfCoconuts: numberOfCoconuts);
      case ParrotType.norwegianBlue:
        return NorwegianBlueParrot(voltage: voltage, isNailed: isNailed);
    }
  }
}

