class Propriedade {

  late String titulo;
  late String texto;


  Propriedade({
    required this.titulo,
    required this.texto,

  });

  Propriedade.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    texto = json['texto'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    return data;
  }
}