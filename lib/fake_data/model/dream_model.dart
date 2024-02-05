
class DreamModel {
  int? id;
  String? title;
  String? sleepTime;
  String? description;
  String? moments;
  List<String>? emotions;
  String? characters;
  int? timestamp;

  DreamModel({
    this.id,
    this.title,
    this.sleepTime,
    this.description,
    this.moments,
    this.emotions,
    this.characters,
    this.timestamp,
  });

  factory DreamModel.fromJson(Map<String, dynamic> json) {
    return DreamModel(
      id: json['id'],
      title: json['title'],
      sleepTime: json['sleepTime'],
      description: json['description'],
      moments: json['moments'],
      emotions: json['emotions'] != null
          ? List<String>.from(json['emotions'])
          : null,
      characters: json['characters'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['sleepTime'] = sleepTime;
    map['description'] = description;
    map['moments'] = moments;
    map['characters'] = characters;
    map['timestamp'] = timestamp;
    if (emotions != null) {
      map['emotions'] = emotions!.map((e) => e).toList();
    }
    return map;
  }
}

