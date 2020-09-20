class Category {
  String id;
  String name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['id'], name: json['name']);
  }
}

class SubCategory {
  String id;
  String name;

  SubCategory({this.id, this.name});

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(id: json['id'], name: json['name']);
  }
}
