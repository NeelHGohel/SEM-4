import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = "https://6672c8fa6ca902ae11b1c68c.mockapi.io/";
  // https://6672c8fa6ca902ae11b1c68c.mockapi.io/Faculty

  Future<void> getUser() async {
    http.Response res = await http.get(Uri.parse('${baseUrl}Faculty'));
    return convertJSONToData(res);
  }

  Future<void> addUser({map}) async {
    http.Response res = await http.post(Uri.parse('${baseUrl}Faculty') , body: map);
    return convertJSONToData(res);
  }

  Future<void> updateUser({id , map}) async {
    http.Response res = await http.put(Uri.parse('${baseUrl}Faculty/$id'), body: map);
    return convertJSONToData(res);
  }

  Future<void> deleteUser({id}) async {
    http.Response res = await http.delete(Uri.parse('${baseUrl}Faculty/$id'));
    return convertJSONToData(res);
  }


  dynamic convertJSONToData(http.Response res) {
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else if (res.statusCode == 404) {
      return 'PAGE NOT FOUND PLEASE CHECK YOUR URL';
    } else {
      return 'NO DATA FOUND';
    }
  }

}
