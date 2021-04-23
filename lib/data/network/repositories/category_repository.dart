import '../../../constants/api.dart';
import '../dio_client.dart';

class CategoryRepository {
  var _httpClient;

  // Construtor Repository
  CategoryRepository() {
    _httpClient = new DioClient();
  }

  // Retorna as comidas
  /*
    * http://10.0.2.2/api/v1/products&token_company=tokenDaCompanhia
    * Para isso preciso de uma Query parametro
    */
  Future<List<dynamic>> getCategories(String tokenCompany) async {
    final response =
        await _httpClient.get("${API_VERSION}/categories", queryParameters: {
      'token_company': tokenCompany,
    });
    //print(response);

    // Converte para lista
    return (response.data['data'] as List).toList();
  }
}
