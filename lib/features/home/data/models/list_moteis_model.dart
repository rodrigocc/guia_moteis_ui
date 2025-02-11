// To parse this JSON data, do
//
//     final motelListModel = motelListModelFromJson(jsonString);

import 'dart:convert';

MotelListModel motelListModelFromJson(String str) =>
    MotelListModel.fromJson(json.decode(str));

String motelListModelToJson(MotelListModel data) => json.encode(data.toJson());

class MotelListModel {
  bool sucesso;
  Data data;
  List<dynamic> mensagem;

  MotelListModel({
    required this.sucesso,
    required this.data,
    required this.mensagem,
  });

  factory MotelListModel.fromJson(Map<String, dynamic> json) => MotelListModel(
        sucesso: json["sucesso"],
        data: Data.fromJson(json["data"]),
        mensagem: List<dynamic>.from(json["mensagem"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "sucesso": sucesso,
        "data": data.toJson(),
        "mensagem": List<dynamic>.from(mensagem.map((x) => x)),
      };
}

class Data {
  int pagina;
  int qtdPorPagina;
  int totalSuites;
  int totalMoteis;
  int raio;
  int maxPaginas;
  List<Motei> moteis;

  Data({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pagina: json["pagina"],
        qtdPorPagina: json["qtdPorPagina"],
        totalSuites: json["totalSuites"],
        totalMoteis: json["totalMoteis"],
        raio: json["raio"],
        maxPaginas: json["maxPaginas"],
        moteis: List<Motei>.from(json["moteis"].map((x) => Motei.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagina": pagina,
        "qtdPorPagina": qtdPorPagina,
        "totalSuites": totalSuites,
        "totalMoteis": totalMoteis,
        "raio": raio,
        "maxPaginas": maxPaginas,
        "moteis": List<dynamic>.from(moteis.map((x) => x.toJson())),
      };
}

class Motei {
  String fantasia;
  String logo;
  String bairro;
  double distancia;
  int qtdFavoritos;
  List<Suite> suites;
  int qtdAvaliacoes;
  double media;

  Motei({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.qtdAvaliacoes,
    required this.media,
  });

  factory Motei.fromJson(Map<String, dynamic> json) => Motei(
        fantasia: json["fantasia"],
        logo: json["logo"],
        bairro: json["bairro"],
        distancia: json["distancia"]?.toDouble(),
        qtdFavoritos: json["qtdFavoritos"],
        suites: List<Suite>.from(json["suites"].map((x) => Suite.fromJson(x))),
        qtdAvaliacoes: json["qtdAvaliacoes"],
        media: json["media"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "fantasia": fantasia,
        "logo": logo,
        "bairro": bairro,
        "distancia": distancia,
        "qtdFavoritos": qtdFavoritos,
        "suites": List<dynamic>.from(suites.map((x) => x.toJson())),
        "qtdAvaliacoes": qtdAvaliacoes,
        "media": media,
      };
}

class Suite {
  String nome;
  int qtd;
  bool exibirQtdDisponiveis;
  List<String> fotos;
  List<Iten> itens;
  List<CategoriaIten> categoriaItens;
  List<Periodo> periodos;

  Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory Suite.fromJson(Map<String, dynamic> json) => Suite(
        nome: json["nome"],
        qtd: json["qtd"],
        exibirQtdDisponiveis: json["exibirQtdDisponiveis"],
        fotos: List<String>.from(json["fotos"].map((x) => x)),
        itens: List<Iten>.from(json["itens"].map((x) => Iten.fromJson(x))),
        categoriaItens: List<CategoriaIten>.from(
            json["categoriaItens"].map((x) => CategoriaIten.fromJson(x))),
        periodos: List<Periodo>.from(
            json["periodos"].map((x) => Periodo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "qtd": qtd,
        "exibirQtdDisponiveis": exibirQtdDisponiveis,
        "fotos": List<dynamic>.from(fotos.map((x) => x)),
        "itens": List<dynamic>.from(itens.map((x) => x.toJson())),
        "categoriaItens":
            List<dynamic>.from(categoriaItens.map((x) => x.toJson())),
        "periodos": List<dynamic>.from(periodos.map((x) => x.toJson())),
      };
}

class CategoriaIten {
  String nome;
  String icone;

  CategoriaIten({
    required this.nome,
    required this.icone,
  });

  factory CategoriaIten.fromJson(Map<String, dynamic> json) => CategoriaIten(
        nome: json["nome"],
        icone: json["icone"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "icone": icone,
      };
}

class Iten {
  String nome;

  Iten({
    required this.nome,
  });

  factory Iten.fromJson(Map<String, dynamic> json) => Iten(
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
      };
}

class Periodo {
  TempoFormatado tempoFormatado;
  String tempo;
  double valor;
  double valorTotal;
  bool temCortesia;
  Desconto? desconto;

  Periodo({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    required this.desconto,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) => Periodo(
        tempoFormatado: tempoFormatadoValues.map[json["tempoFormatado"]]!,
        tempo: json["tempo"],
        valor: json["valor"]?.toDouble(),
        valorTotal: json["valorTotal"]?.toDouble(),
        temCortesia: json["temCortesia"],
        desconto: json["desconto"] == null
            ? null
            : Desconto.fromJson(json["desconto"]),
      );

  Map<String, dynamic> toJson() => {
        "tempoFormatado": tempoFormatadoValues.reverse[tempoFormatado],
        "tempo": tempo,
        "valor": valor,
        "valorTotal": valorTotal,
        "temCortesia": temCortesia,
        "desconto": desconto?.toJson(),
      };
}

class Desconto {
  double desconto;

  Desconto({
    required this.desconto,
  });

  factory Desconto.fromJson(Map<String, dynamic> json) => Desconto(
        desconto: json["desconto"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "desconto": desconto,
      };
}

enum TempoFormatado { THE_12_HORAS, THE_3_HORAS, THE_6_HORAS }

final tempoFormatadoValues = EnumValues({
  "12 horas": TempoFormatado.THE_12_HORAS,
  "3 horas": TempoFormatado.THE_3_HORAS,
  "6 horas": TempoFormatado.THE_6_HORAS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
