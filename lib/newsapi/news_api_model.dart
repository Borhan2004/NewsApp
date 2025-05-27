class NewsApi {
  String? status;
  int? totalResults;
  List<Result>? results;
  dynamic nextPage;

  NewsApi({this.status, this.totalResults, this.results, this.nextPage});

  NewsApi.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results!.add(Result.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}

class Result {
  Result();

  Result.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}
