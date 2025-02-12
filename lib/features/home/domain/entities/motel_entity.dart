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
}
