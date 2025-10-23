class Articles {
  late String source;
  late String author;
  late String title;
  late String url;
  late String urlToImage;
  late String description;
  late String publishedAt;
  late String content;

  Articles(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source']['name'] ?? '';
    author = json['author'] ?? '';
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    url = json['url'] ?? '';
    urlToImage = json['urlToImage'] ??
        'https://static.vecteezy.com/system/resources/previews/022/059/000/non_2x/no-image-available-icon-vector.jpg';
    publishedAt = json['publishedAt'] ?? '';

    final text = json['content'] ?? '';
    content = text.replaceAll(RegExp(r'<[^>]+>'), '');
    ;
  }
}
