import 'dart:convert';

List<BlogPost> postFromJson(String str) =>
    List<BlogPost>.from(json.decode(str).map((x) => BlogPost.fromMap(x)));

class BlogPost {
  BlogPost({
    required this.id,
    required this.title,
    required this.body,
  });

  int id;
  String title;
  String body;

  factory BlogPost.fromMap(Map<String, dynamic> json) => BlogPost(
    id: json["id"],
      title: json["title"],
      body: json["body"],
  );
}
