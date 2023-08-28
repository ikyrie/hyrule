import 'package:dio/dio.dart';
import 'package:hyrule/domain/business/api_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

class DataApi implements ApiWorkflow {
  final Dio dio = Dio();
  List<Entry> list = [];

  @override
  Future<List<Entry>> getEntriesByCategory ({required String category}) async {
    String url = "https://botw-compendium.herokuapp.com/api/v3/compendium/category/$category";
    final response = await dio.get(url);
    list = List<Entry>.from(response.data["data"].map((e) => Entry.fromMap(e)));
    return list;
  }
}
