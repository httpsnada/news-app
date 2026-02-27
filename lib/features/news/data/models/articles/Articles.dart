import 'Source.dart';

/// source : {"id":null,"name":"Gizmodo.com"}
/// author : "Kyle Torpey"
/// title : "Major Bitcoin Miner Sells $305 Million Worth of Crypto to Fund Pivot to AI"
/// description : "For the dubious tech of the last decade, one door closes and another one opens."
/// url : "https://gizmodo.com/major-bitcoin-miner-sells-305-million-worth-of-crypto-to-fund-pivot-to-ai-2000720078"
/// urlToImage : "https://gizmodo.com/app/uploads/2026/02/AI-pivot-1200x675.jpg"
/// publishedAt : "2026-02-10T16:10:27Z"
/// content : "Over the weekend, bitcoin miner Cango sold 4,451 bitcoin for around $305 million. According to a company press release, the sale was completed to partially pay down a bitcoin-collateralized loan. Add… [+3923 chars]"

class Articles {
  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
