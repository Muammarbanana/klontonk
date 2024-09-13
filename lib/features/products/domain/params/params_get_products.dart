import 'dart:convert';

class ParamsGetProducts {
  const ParamsGetProducts({this.page, this.limit, this.keyword});

  final int? page;
  final int? limit;
  final String? keyword;

  String toJson() => jsonEncode(toMap());

  Map<String, dynamic> toMap() => {
        if (page != null) 'page': page,
        if (limit != null) 'limit': limit,
        if (keyword != null) 'keyword': keyword,
      };
}
