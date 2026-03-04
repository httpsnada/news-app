import 'package:news_app/features/news/data/models/sources/Source.dart';

class SourceModel {
  SourceModel({this.status, this.sources});

  SourceModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

  String? status;
  List<Source>? sources;

  // String? code;
  // String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
