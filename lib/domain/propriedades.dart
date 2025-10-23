class Propriedade {
  late String titulo;
  late String texto;
  late String icone;

  Propriedade({
    required this.titulo,
    required this.texto,
    required this.icone,

  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    texto = json['texto'];
    icone = json['icone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    data['icone'] = this.icone;
    return data;
  }
}

