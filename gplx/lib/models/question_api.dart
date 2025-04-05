import 'dart:convert';

import 'package:gplx/entities/Rank.dart';
import 'package:gplx/entities/test.dart';
import 'package:gplx/models/base_url.dart';
import 'package:http/http.dart' as http;
class QuestionAPI {

  Future<List<Rank>> findAllRank() async {

    var respone = await http.get(Uri.parse(BaseUrl.url + "test/findAllRank"));
    if (respone.statusCode == 200) {
      List<dynamic> res = jsonDecode(utf8.decode(respone.bodyBytes));
      return res.map((e) => Rank.fromMap(e)).toList();
    } else {
      throw Exception("Bad request");
    }
  }

}