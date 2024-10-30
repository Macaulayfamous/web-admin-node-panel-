import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200: // 200 code means succesfull request
      onSuccess();
      break;
    case 400: // 400 code means bad request
      showSnackber(context, json.decode(response.body)['msg']);
      break;

    case 500: // 500 code means server error
      showSnackber(context, json.decode(response.body)['error']);
      break;

    case 201: // 201 code means resource successfully created
      onSuccess();
      break;
  }
}

void showSnackber(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}
