import 'Articles.dart';

/// status : "ok"
/// totalResults : 8960
/// articles : [{"source":{"id":null,"name":"Gizmodo.com"},"author":"Kyle Torpey",
/// "title":"Major Bitcoin Miner Sells $305 Million Worth of Crypto to Fund Pivot to AI",
/// "description":"For the dubious tech of the last decade, one door closes and another one opens.",
/// "url":"https://gizmodo.com/major-bitcoin-miner-sells-305-million-worth-of-crypto-to-fund-pivot-to-ai-2000720078",
/// "urlToImage":"https://gizmodo.com/app/uploads/2026/02/AI-pivot-1200x675.jpg",
/// "publishedAt":"2026-02-10T16:10:27Z","content":"Over the weekend, bitcoin miner Cango sold 4,451 bitcoin for around $305 million. According to a company press release, the sale was completed to partially pay down a bitcoin-collateralized loan. Add… [+3923 chars]"},}]

class ArticlesModel {
  ArticlesModel({this.status, this.totalResults, this.articles});

  ArticlesModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }

  String? status;
  num? totalResults;
  List<Articles>? articles;

  // String? code;
  // String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
