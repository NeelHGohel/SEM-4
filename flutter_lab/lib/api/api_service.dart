import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class ApiService {
  String baseUrl = "https://6672c8fa6ca902ae11b1c68c.mockapi.io/";
  // https://6672c8fa6ca902ae11b1c68c.mockapi.io/Faculty

  ProgressDialog? pd;

  void showProgressDialog(context) {
    if (pd == null) {
      pd = ProgressDialog(context);
      pd!.style(
        message: 'Please Wait',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
      );
    }
    pd!.show();
  }

  void dismissProgress() {
    if (pd != null && pd!.isShowing()) {
      pd!.hide();
    }
  }

  Future<dynamic> getUsers(context) async {
    showProgressDialog(context);
    http.Response res = await http.get(Uri.parse(baseUrl + 'Faculty'));
    dismissProgress();
    return convertJSONToData(res);
  }

  Future<dynamic> addUser({context, map}) async {
    showProgressDialog(context);
    http.Response res =
        await http.post(Uri.parse(baseUrl + 'Faculty'), body: map);
    dismissProgress();
    return convertJSONToData(res);
  }

  Future<dynamic> updateUser({id, map, context}) async {
    showProgressDialog(context);
    http.Response res =
        await http.put(Uri.parse(baseUrl + 'Faculty/$id'), body: map);
    dismissProgress();
    return convertJSONToData(res);
  }

  Future<dynamic> deleteUser({id, context}) async {
    showProgressDialog(context);
    http.Response res = await http.delete(Uri.parse(baseUrl + 'Faculty/$id'));
    dismissProgress();
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
