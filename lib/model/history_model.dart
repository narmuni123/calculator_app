import 'package:objectbox/objectbox.dart';

@Entity()
class CalculatorData {
  int id;
  String data;

  CalculatorData({
    this.id = 0,
    required this.data,
  });
}