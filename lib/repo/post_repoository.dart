import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:block_work/model/api_model.dart';
import 'package:http/http.dart' as htpps;

class PostRepository {
  List<ApiModel> list = [];
  Future<List<ApiModel>> getPost() async {
    try {
      final dynamic url =
          Uri.parse('https://jsonplaceholder.typicode.com/comments');
      final response = await htpps.get(url);
      if (response.statusCode == 200) {
        final body = json.decode(response.body.toString());
        for (var i in body) {
          list.add(ApiModel.fromJson(i));
        }
        return list;
      }
    } on SocketException {
      throw Exception("Error While Contecting");
    } on TimeoutException {
      throw Exception("error while fetching data");
    }
    throw Exception("error while fetching Data");
  }
}
