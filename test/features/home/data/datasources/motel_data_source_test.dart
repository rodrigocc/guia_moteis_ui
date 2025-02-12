import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis_v1/features/home/data/datasources/fetch_list_moteis_datasource.dart';
import 'package:guia_moteis_v1/features/home/data/models/motel_item_model.dart';
import 'package:guia_moteis_v1/config/mock_http_client.dart';
import 'package:guia_moteis_v1/config/http_client.dart'; // Certifique-se de importar seu IHttpClient
import 'dart:convert';

void main() {
  late MotelRemoteDataSource dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient({
      'https://www.jsonkeeper.com/b/1IXK': HttpResponse(
        statusCode: 200,
        body: json.encode({
          'data': {
            'moteis': [
              {
                'fantasia': 'Motel Luxo',
                'logo': 'https://example.com/logo.png',
                'bairro': 'Centro',
                'distancia': 5.2,
                'suites': [
                  {
                    'nome': 'Suíte Premium',
                    'fotos': ['https://example.com/suite.png'],
                    'periodos': [
                      {'valorTotal': 150.0}
                    ]
                  }
                ]
              }
            ]
          }
        }),
      ),
    });

    dataSource = MotelRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('MotelRemoteDataSource', () {
    test('Deve retornar uma lista de motéis quando a resposta for 200',
        () async {
      final result = await dataSource.fetchMoteis();

      expect(result, isA<List<Motel>>());
      expect(result.length, 1);
      expect(result.first.nome, 'Motel Luxo');
      expect(result.first.suites.first.precoMinimo, 150.0);
    });

    test('Deve lançar uma Exception quando a resposta não for 200', () async {
      mockHttpClient = MockHttpClient({
        'https://www.jsonkeeper.com/b/1IXK': HttpResponse(
          statusCode: 500,
          body: 'Erro no servidor',
        ),
      });

      dataSource = MotelRemoteDataSourceImpl(client: mockHttpClient);

      expect(() => dataSource.fetchMoteis(), throwsException);
    });
  });
}
