import 'dart:convert';

import '../model/reftable.dart';
import 'package:http/http.dart' as http;

class APIRepository {
  String apiURL = "https://wincom2cloud.com/blazorapp/api/";

  Future<List<RefTable>> getItemType(String comp, String branch) async {
    String url = apiURL + "ItemMaster/itemtypes/$comp/$branch";
    print(url);
    var response = await http
        .get(Uri.parse(url), headers: {'content-type': 'application/json'});

    var resp = jsonDecode(response.body);

    List<RefTable> list = <RefTable>[];

    if (resp['ok'] == "yes") {
      dynamic data = resp['data'];

      data.forEach((item) {
        list.add(RefTable.fromJson(item));
      });
    } else {
      print('Error getting data....');
    }
    return list;
  }
}
