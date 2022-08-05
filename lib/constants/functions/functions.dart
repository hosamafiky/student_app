import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void dioErrorHandling({
  required BuildContext context,
  required Response response,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, response.data['message']);
      break;
    case 500:
      showSnackBar(context, response.data['error']);
      break;
    default:
      showSnackBar(context, 'حدث خطأ ما : ${response.data}');
      break;
  }
}

void showSnackBar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

void nextPage(context, route, {arguments}) {
  Navigator.of(context).pushNamed(route, arguments: arguments);
}

Future<File?> pickFiles() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );
  return result != null ? File(result.files.single.path!) : null;
}
