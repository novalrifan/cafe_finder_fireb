import '../../models/models.dart';

abstract class BasePlacesRepo {
  Future<void> addPlace(Coffeeshop coffeeshop);
  Future<void> editPlaceSettings(Coffeeshop coffeeshop);
  Future<void> editPlaceOpeningHours(List<OpeningHours> openingHours);
  Stream<List<Coffeeshop>> getPlaces();
}
