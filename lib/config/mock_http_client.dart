import 'package:guia_moteis_v1/config/http_client.dart';
import 'package:http/http.dart' as http;

// class MockHttpClient extends http.BaseClient {
//   final Map<String, http.Response> mockResponses;

//   MockHttpClient(this.mockResponses);

//   @override
//   Future<http.StreamedResponse> send(http.BaseRequest request) async {
//     final response = mockResponses[request.url.toString()] ??
//         http.Response('Not Found', 404);

//     return http.StreamedResponse(
//       Stream.value(response.bodyBytes),
//       response.statusCode,
//       headers: response.headers,
//     );
//   }
// }

class MockHttpClient implements IHttpClient {
  final Map<String, HttpResponse> mockResponses;

  MockHttpClient(this.mockResponses);

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    return mockResponses[url] ??
        HttpResponse(statusCode: 404, body: 'Not Found');
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Object? body}) async {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, Object? body}) async {
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> delete(String url,
      {Map<String, String>? headers}) async {
    throw UnimplementedError();
  }
}
