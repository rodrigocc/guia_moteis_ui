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
  final List<String> itens;
  final List<CategoriaItem> categoriaItens;

  Suite({
    required this.nome,
    required this.imagem,
    required this.precoMinimo,
    required this.itens,
    required this.categoriaItens,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'],
      imagem: (json['fotos'] as List).isNotEmpty ? json['fotos'][0] : '',
      precoMinimo: (json['periodos'] as List).isNotEmpty
          ? (json['periodos'] as List)
              .map((p) => (p['valorTotal'] as num).toDouble())
              .reduce((a, b) => a < b ? a : b)
          : 0.0,
      itens: (json['itens'] as List)
          .map((item) => item['nome'] as String)
          .toList(),
      categoriaItens: (json['categoriaItens'] as List)
          .map((cat) => CategoriaItem.fromJson(cat))
          .toList(),
    );
  }
}

class CategoriaItem {
  final String nome;
  final String icone;

  CategoriaItem({required this.nome, required this.icone});

  factory CategoriaItem.fromJson(Map<String, dynamic> json) {
    return CategoriaItem(
      nome: json['nome'],
      icone: json['icone'],
    );
  }
}

List<Motel> parseMoteis(Map<String, dynamic> parsedJson) {
  return (parsedJson['data']['moteis'] as List)
      .map((json) => Motel.fromJson(json))
      .toList();
}
