class UrbanDict {
  final List<Definition> list;

  UrbanDict({required this.list});

  factory UrbanDict.fromJson(Map<String, dynamic> json) {
    return UrbanDict(list: Definition.fromJsonList(json['list'] ?? []));
  }
}

class Definition {
  final int defid;
  final String definition;
  final String author;
  final String word;
  final DateTime writtenOn;
  final String example;
  final int thumbsUp;
  final int thumbsDown;
  final String permalink;

  Definition(
      {required this.defid,
      required this.definition,
      required this.author,
      required this.word,
      required this.writtenOn,
      required this.example,
      required this.thumbsUp,
      required this.thumbsDown,
      required this.permalink});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
        defid: json['defid'],
        definition: json['definition'].replaceAll(RegExp(r'[\[\]]'), ''),
        author: json['author'],
        word: json['word'],
        writtenOn: DateTime.parse(json['written_on']),
        example: json['example'].replaceAll(RegExp(r'[\[\]]'), ''),
        thumbsUp: json['thumbs_up'],
        thumbsDown: json['thumbs_down'],
        permalink: json['permalink']);
  }

  static List<Definition> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((x) => Definition.fromJson(x)).toList();
  }

  Map<String, dynamic> toMap() => {
        'defid': defid,
        'definition': definition,
        'author': author,
        'word': word,
        'written_on': writtenOn,
        'example': example,
        'thumbs_up': thumbsUp,
        'thumbs_down': thumbsDown,
        'permalink': permalink
      };
}
