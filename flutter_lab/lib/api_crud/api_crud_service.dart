import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCrudService {
  String baseURL = "https://6672c8fa6ca902ae11b1c68c.mockapi.io/";

  Future<dynamic> getUser() async {
    http.Response res = await http.get(Uri.parse(baseURL + "Faculty"));
    return convertData(res);
  }

  Future<dynamic> addUser({map}) async {
    http.Response res =
        await http.post(Uri.parse(baseURL + "Faculty"), body: map);
    return convertData(res);
  }

  Future<dynamic> updateUser({id, map}) async {
    http.Response res =
        await http.put(Uri.parse(baseURL + "Faculty/$id"), body: map);
    return convertData(res);
  }

  Future<dynamic> deleteUser({id}) async {
    http.Response res = await http.delete(Uri.parse(baseURL + "Faculty/$id"));
    return convertData(res);
  }

  dynamic convertData(http.Response res) {
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else if (res.statusCode == 404) {
      return "Server Not found";
    } else {
      return "No data found";
    }
  }
}
