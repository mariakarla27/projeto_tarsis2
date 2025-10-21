class Address {
  late String titulo;
  late String texto;
  late String icone;


  Address({
    required this.titulo,
    required this.texto,
    required this.icone,

  });
  String get completeAddress => '$titulo ,$texto, $icone ';

  Address.fromJson(Map<String, dynamic> json) {
    // if(json['cep'] != null){
    //   cep = json['cep'];
    // } else {
    //   json['cep'] = '';
    // }
    titulo = json['titulo'] ?? '';
    texto = json['texto'] ?? '';
    icone = json['icone'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    data['icone'] = this.icone;
    return data;
  }
}