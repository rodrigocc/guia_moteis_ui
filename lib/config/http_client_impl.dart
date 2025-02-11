import 'dart:convert';

import 'package:guia_moteis_v1/config/http_client.dart';
import 'package:http/http.dart' as http;

class HttpClientImpl implements IHttpClient {
  final http.Client client;

  HttpClientImpl(this.client);

  @override
  Future<HttpResponse> delete(String url, {Map<String, String>? headers}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    final response = await client.get(Uri.parse(url), headers: headers);

    return _handleResponse(response);
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Object? body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, Object? body}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  HttpResponse _handleResponse(http.Response response) {
    try {
      // Tenta converter o body para JSON, se for válido
      final dynamic body =
          response.body.isNotEmpty ? jsonDecode(response.body) : null;
      return HttpResponse(statusCode: response.statusCode, body: body);
    } catch (e) {
      // Retorna um HttpResponse mesmo que o body não seja um JSON válido
      return HttpResponse(statusCode: response.statusCode, body: response.body);
    }
  }
}
