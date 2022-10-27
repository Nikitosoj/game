import 'package:tap_models/tap_model.dart';
import 'package:tap_services/data_models/db_tap.dart';
import 'package:tap_services/database.dart';

class TapRepository {
  Future<void> addTap(TapModel tap) async {
    await DBProvider.db.addTap(DBTap(
      id: tap.id,
      title: tap.title,
      description: tap.description,
    ));
  }
}
