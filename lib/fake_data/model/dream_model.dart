
class DreamModel {
  int? id;
  String? sleepTime;
  String? description;
  String? moments;
  List<String>? emotions;
  String? characters;

  DreamModel({
    this.id,
    this.sleepTime,
    this.description,
    this.moments,
    this.emotions,
    this.characters,
  });

  factory DreamModel.fromJson(Map<String, dynamic> json) {
    return DreamModel(
      id: json['id'],
      sleepTime: json['sleepTime'],
      description: json['description'],
      moments: json['moments'],
      emotions: json['emotions'] != null
          ? List<String>.from(json['emotions'])
          : null,
      characters: json['characters'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sleepTime'] = sleepTime;
    map['description'] = description;
    map['moments'] = moments;
    map['characters'] = characters;
    if (emotions != null) {
      map['emotions'] = emotions!.map((e) => e).toList();
    }
    return map;
  }
}

