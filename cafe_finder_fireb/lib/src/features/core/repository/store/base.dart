import '../../models/coffeestore_model.dart';

abstract class BaseRepo {
  Stream<List<Coffeeshops>> getCoffeeshops();
}
