
import 'package:calculator_app/model/history_model.dart';
import 'package:calculator_app/objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<CalculatorData> _box;

  ObjectBox._init(this._store) {
    _box = Box<CalculatorData>(_store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();

    return ObjectBox._init(store);
  }

  CalculatorData? getDataId(int id) => _box.get(id);

  Stream<List<CalculatorData>> getData() => _box
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());

  int insertData(CalculatorData calculatorData) => _box.put(calculatorData);

  bool deleteData(int id) => _box.remove(id);
  int deleteAll() => _box.removeAll();
}