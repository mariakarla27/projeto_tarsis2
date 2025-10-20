class Address {
  late String titulo;
  late String texto;
  late String icon;


  Address({
    required this.titulo,
    required this.texto,
    required this.icon,

  });
  String get completeAddress => '$titulo - $icon, $icon';

  Address.fromJson(Map<String, dynamic> json) {
    // if(json['cep'] != null){
    //   cep = json['cep'];
    // } else {
    //   json['cep'] = '';
    // }
    titulo = json['titulo'] ?? '';
    texto = json['texto'] ?? '';
    icon = json['icon'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    data['icon'] = this.icon;
    return data;
  }
}