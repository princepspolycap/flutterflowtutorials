// code created by https://www.youtube.com/@flutterflowexpert
// video - https://youtu.be/y5GfG-eX1QM
// if you have problem implementing this code you can hire me as a mentor - https://calendly.com/bulgaria_mitko

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../auth/auth_util.dart';
import '../../backend/firebase_storage/storage.dart';

Future<String> uploadFileToLocalAndWeb(String? url) async {
  // null safety
  url ??= '';

  final response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;

  final fileName = Uri.parse(url).pathSegments.last;
  String dir = '/users/' + currentUserUid + '/';
  final filePath = dir + fileName;

  final downloadUrl = await uploadData(filePath, bytes);

  return downloadUrl ?? '';
}