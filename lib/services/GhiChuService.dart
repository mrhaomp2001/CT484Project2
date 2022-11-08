import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/GhiChu.dart';
import '../models/http_exception.dart';
import '../models/auth_token.dart';

import './api_service.dart';

class GhiChuService {
  late AuthToken authToken;
  String _buildNoteUrl(String method) {
    return 'https://api-ct484.vercel.app/api/note/$method';
  }

  Future<List<GhiChu>> getListGhiChu() async {
    final List<GhiChu> ghiChus = [];
    try {
      final url = Uri.parse(_buildNoteUrl(authToken.userId));

      var response = await http.get(
        url,
        headers: <String, String>{
          HttpHeaders.authorizationHeader: authToken.token,
          "Content-Type": "application/json",
        },
      );

      final responseJson = json.decode(response.body);
      print(responseJson.length);

      return ghiChus;
    } catch (error) {
      print(" >> error: " + error.toString());
      rethrow;
    }
  }

  AuthToken _fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['accessToken'],
      userId: json['id'],
      username: json['username'],
    );
  }
}
