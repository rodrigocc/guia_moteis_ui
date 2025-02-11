import 'package:http/http.dart' as http;

class MockHttpClient extends http.BaseClient {
  final Map<String, http.Response> mockResponses;

  MockHttpClient(this.mockResponses);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final response = mockResponses[request.url.toString()] ??
        http.Response('Not Found', 404);

    return http.StreamedResponse(
      Stream.value(response.bodyBytes),
      response.statusCode,
      headers: response.headers,
    );
  }
}
