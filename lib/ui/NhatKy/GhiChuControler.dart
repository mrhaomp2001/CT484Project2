import 'package:flutter/material.dart';
import '../../models/GhiChu.dart';
import 'package:flutter/foundation.dart';
import '../../models/auth_token.dart';
import '../../services/GhiChuService.dart';

class GhiChuControler with ChangeNotifier {
  late AuthToken authToken;

  GhiChuControler([AuthToken? authToken]) : _ghiChuService = GhiChuService();

  set authToken2(AuthToken? authToken) {
    if (authToken != null)
      _ghiChuService.authToken = authToken;
    else {}
  }

  List<GhiChu> nhatKys = [];

  final GhiChuService _ghiChuService;

  Future<void> fetchGhiChu() async {
    nhatKys = await _ghiChuService.getListGhiChu();
    print(nhatKys);
  }

  int get NhatKyCount {
    return nhatKys.length;
  }
}
