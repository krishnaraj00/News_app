class Article {
  final String? author;
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? content;
  final String? publishedAt;

  Article({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.content,
    this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      publishedAt: json['publishedAt'],
    );
  }
}
