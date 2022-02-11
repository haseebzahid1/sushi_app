class MenuType {
  int? id;
  String? title;

  MenuType({
    this.id,
    this.title,});

  MenuType.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    return map;
  }

}