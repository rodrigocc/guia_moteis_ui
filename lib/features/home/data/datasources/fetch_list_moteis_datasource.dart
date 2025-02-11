import 'dart:convert';
import 'package:guia_moteis_v1/config/http_client.dart';
import 'package:guia_moteis_v1/features/home/data/models/motel_item_model.dart';

abstract class MotelRemoteDataSource {
  Future<List<Motel>> fetchMoteis();
}

class MotelRemoteDataSourceImpl implements MotelRemoteDataSource {
  final IHttpClient client;
  final String apiUrl = 'https://www.jsonkeeper.com/b/1IXK';

  MotelRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Motel>> fetchMoteis() async {
    try {
      final response = await client.get(apiUrl);

      if (response.statusCode == 200) {
        return parseMoteis(response.body);
      } else {
        throw Exception("Falha ao carregar os motéis");
      }
    } catch (e) {
      throw Exception("Erro ao buscar os dados: $e");
    }
  }
}
