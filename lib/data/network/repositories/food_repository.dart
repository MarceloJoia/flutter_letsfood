import '../../../constants/api.dart';
import '../dio_client.dart';

class FoodRepository {
  var _httpClient;

  // Construtor Repository
  FoodRepository() {
    _httpClient = new DioClient();
  }

  // Retorna as comidas
  /** 
    * http://10.0.2.2/api/v1/products&token_company=tokenDaCompanhia
    * Para isso preciso de uma Query parametro
    */
  Future<List<dynamic>> getFoods(String tokenCompany,
      {List<String> filterCategories}) async {
    final response =
        await _httpClient.get("${API_VERSION}/products", queryParameters: {
      'token_company': tokenCompany,
      'categories': (filterCategories != null && filterCategories.length > 0)
          ? filterCategories
          : [],
    });
    //print(response);

    // Converte para lista
    return (response.data['data'] as List).toList();
  }
}
