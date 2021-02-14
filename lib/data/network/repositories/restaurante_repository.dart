import '../dio_client.dart';
import '../../../models/Restaurant.dart';
import '../../../constants/api.dart';

class RestaurantRepository {
  // Criar uma variável para receber httpClient
  var _httpClient;

  // Construtor do repository instanciar o dio_client.dart
  RestaurantRepository() {
    _httpClient = new DioClient();
  }

  /**
   * Todas as comunicações com as API relacionada a restaurantes, Fica aqui!
   */

  // 1) Retorna os restaurantes que vai alimentar nossa View
  Future<List<Restaurant>> getRestaurants() async {
    final response = await _httpClient.get('${API_VERSION}/tenants');

    final _restaurants = (response.data['data'] as List)
        .map((restaurants) => Restaurant.fromJson(restaurants))
        .toList();

    return _restaurants;
  }
}
