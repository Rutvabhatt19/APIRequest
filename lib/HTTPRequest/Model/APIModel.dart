class News {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  News(
      {this.id,
        this.name,
        this.description,
        this.url,
        this.category,
        this.language,
        this.country});

  factory News.fromJson({required Map<String, dynamic> data}) {
    final source = data['source'];
    return News(
      id :source !=null?source['id'] :null,
      name : source != null ? source['name'] : null,
      description : data['description'],
      url : data['url'],
      category : data['category'],
      language : data['language'],
      country : data['country'],
    );
  }

}