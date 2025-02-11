import 'dart:convert';

class Motel {
  final String nome;
  final String logo;
  final String bairro;
  final double distancia;
  final List<Suite> suites;

  Motel({
    required this.nome,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.suites,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      nome: json['fantasia'],
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: (json['distancia'] as num).toDouble(),
      suites: (json['suites'] as List).map((s) => Suite.fromJson(s)).toList(),
    );
  }
}

class Suite {
  final String nome;
  final String imagem;
  final double precoMinimo;

  Suite({
    required this.nome,
    required this.imagem,
    required this.precoMinimo,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'],
      imagem: (json['fotos'] as List).isNotEmpty
          ? json['fotos'][0] // Pegamos apenas a primeira imagem
          : '',
      precoMinimo: (json['periodos'] as List).isNotEmpty
          ? (json['periodos'] as List)
              .map((p) => (p['valorTotal'] as num).toDouble())
              .reduce((a, b) => a < b ? a : b) // Pegamos o menor valor
          : 0.0,
    );
  }
}

// Função para converter JSON para lista de motéis
// List<Motel> parseMoteis(String responseBody) {
//   final parsed = json.decode(responseBody);
//   return (parsed['data']['moteis'] as List)
//       .map((json) => Motel.fromJson(json))
//       .toList();
// }

List<Motel> parseMoteis(Map<String, dynamic> parsedJson) {
  return (parsedJson['data']['moteis'] as List)
      .map((json) => Motel.fromJson(json))
      .toList();
}
