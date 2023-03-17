import '../../models/customer_models.dart';

abstract class BaseCustomerRepo {
  // Future<void> addUser(Customer customer);
  // Future<void> editPlaceSettings(Coffeeshop coffeeshop);
  // Future<void> editPlaceOpeningHours(List<OpeningHours> openingHours);
  Stream<List<Customer>> getUser();
}
