abstract class IHttpClient {
  Future<HttpResponse> get(String url, {Map<String, String>? headers});
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Object? body});
  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, Object? body});
  Future<HttpResponse> delete(String url, {Map<String, String>? headers});
}

class HttpResponse {
  final int statusCode;
  final dynamic body;

  HttpResponse({required this.statusCode, required this.body});
}
