import 'dart:convert';
import 'package:guia_moteis_v1/config/http_client.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';

class HttpClientImpl implements IHttpClient {
  final http.Client client;

  HttpClientImpl(this.client);

  @override
  Future<HttpResponse> delete(String url, {Map<String, String>? headers}) {
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
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, Object? body}) {
    throw UnimplementedError();
  }

  HttpResponse _handleResponse(http.Response response) {
    try {
      // Decodifica corretamente para UTF-8 antes de processar o JSON
      Uint8List bytes = response.bodyBytes;
      String decodedBody = utf8.decode(bytes);

      final dynamic body =
          decodedBody.isNotEmpty ? jsonDecode(decodedBody) : null;

      return HttpResponse(statusCode: response.statusCode, body: body);
    } catch (e) {
      return HttpResponse(statusCode: response.statusCode, body: response.body);
    }
  }
}
