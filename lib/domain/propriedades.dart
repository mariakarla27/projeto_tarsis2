class Propriedade {
  late int iconType;
  late String titulo;
  late String texto;

  Propriedade({
    required this.iconType,
    required this.titulo,
    required this.texto,

  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    iconType = json['icon_type'];
    titulo = json['titulo'];
    texto = json['texto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['icon_type'] = this.iconType;
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    return data;
  }
}

