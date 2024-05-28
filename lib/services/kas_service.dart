part of 'services.dart';

class KasService {
  
  Future<SaldoKas> createKas(SaldoKas newKas ,  String token) async{
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas');
    try{
      final response = await http.post(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(newKas),
      );
      final responseData = ApiHelper.handleResponse(response);
      final saldoKas = SaldoKas.fromJson(responseData['data']);
      return saldoKas;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<SaldoKas> getAllKas () async {
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas');
    try{
      final response = await http.get(
        url,
        headers: ApiHelper.getHeaders(''),
      );
      final responseData = ApiHelper.handleResponse(response);
      final allKas = SaldoKas.fromJson(responseData['data']);
      return allKas;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<SaldoKas> updateKas (int idKas, SaldoKas updatedKas, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas/${idKas}');
    try{
      final response = await http.put(
        url,
        headers: ApiHelper.getHeaders(token),
        body: jsonEncode(updatedKas)
      );
      final responseData = ApiHelper.handleResponse(response);
      final updatedKasData = SaldoKas.fromJson(responseData['data']);
      return updatedKasData;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }

  Future<SaldoKas> deleteKas (int idKas, String token) async {
    final url = Uri.parse('${ApiHelper.baseUrl}/saldo-kas/${idKas}');
    try{
      final response = await http.delete(
        url,
        headers: ApiHelper.getHeaders(token),
      );
      final responseData = ApiHelper.handleResponse(response);
      final updatedKas = SaldoKas.fromJson(responseData['data']);
      return updatedKas;
    }catch(e){
      return ApiHelper.handleError(e);
    }
  }
}