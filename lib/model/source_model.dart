class Source {
  String id;
  String name;

  Source({this.id, this.name});

  // todo factory

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
