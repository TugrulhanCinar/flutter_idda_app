
import 'package:flutteriddaapp/models/kuponModel.dart';
import 'kupons_client.dart';

class KuponRepository{
  final KuponClient _teamsClient = KuponClient();

  Future<Kupon> fetchKupons() => _teamsClient.fetchAllKupons();

}