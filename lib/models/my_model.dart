class MyModel {
  bool? barrier;
  List<History>? history;

  MyModel({this.barrier, this.history});

  MyModel.fromJson(Map<dynamic, dynamic> json) {
    barrier = json['barrier'];
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['barrier'] = barrier;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String? datetime;
  String? name;

  History({this.datetime, this.name});

  History.fromJson(Map<dynamic, dynamic> json) {
    datetime = json['datetime'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['datetime'] = datetime;
    data['name'] = name;
    return data;
  }
}
