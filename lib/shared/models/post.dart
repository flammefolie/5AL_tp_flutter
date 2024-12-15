class Post {
  int id;
  String title;
  String description;

  Post({required this.id, required this.title, required this.description});

  Post copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
