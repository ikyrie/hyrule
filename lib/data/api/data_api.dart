import 'package:dio/dio.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/utils/consts/api.dart';

class DataApi {
  final Dio dio = Dio();
  List<Entry> list = [];

  Future<List<Entry>> getEntriesByCategory ({required String category}) async {
    final response = await dio.get(url + category);
    list = List<Entry>.from(response.data["data"].map((e) => Entry.fromMap(e)));
    return list;
  }
}
