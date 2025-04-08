import 'dart:convert';

import 'package:gplx/entities/Rank.dart';
import 'package:gplx/entities/test.dart';
import 'package:gplx/models/base_url.dart';
import 'package:http/http.dart' as http;
class TestAPI {

  Future<Test> findById(int id) async {
    var respone = await http.get(Uri.parse(BaseUrl.url + "test/findById/" + id.toString()));
    print(respone.body);
    if (respone.statusCode == 200) {
      dynamic res = jsonDecode(respone.body);
      return Test.fromMap(res);
    } else {
      throw Exception("Bad request");
    }
  }


  Future<List<Test>> findAllByTypeAndRankId(int type, int rankId) async {

    var respone = await http.get(Uri.parse(BaseUrl.url + "test/findAllByTypeAndRankId/" + type.toString() + "/" + rankId.toString()));
    if (respone.statusCode == 200) {
      List<dynamic> res = jsonDecode(utf8.decode(respone.bodyBytes));
      return res.map((e) => Test.fromMap(e)).toList();
    } else {
      throw Exception("Bad request");
    }
  }

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