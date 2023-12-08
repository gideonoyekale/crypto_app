import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../constants/hive_boxes.dart';

class LocalStorageService {
  LocalStorageService._internal();
  static final LocalStorageService _instance = LocalStorageService._internal();
  static LocalStorageService get instance => _instance;
  late Box box;

  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(HiveBoxes.appBox);
    box = Hive.box(HiveBoxes.appBox);
  }

  save(String key, String? value) {
    box.put(key, value);
  }

  saveBool(String key, bool? value) {
    box.put(key, value);
  }

  saveMap(String key, Map? value) {
    box.put(key, value == null ? null : jsonEncode(value));
  }

  saveList(String key, List<Map<String, dynamic>> value) {
    box.put(key, value);
  }

  List<Map<String, dynamic>>? getList(String key) {
    final res = box.get(key, defaultValue: []);
    return (res as List).map((e) => Map<String, dynamic>.from(e)).toList();
  }

  Map<String, dynamic>? getMap(String key) {
    final res = box.get(key, defaultValue: null);
    return res == null ? null : jsonDecode(res);
  }

  String? getString(String key) {
    return box.get(key, defaultValue: null);
  }

  int? getInt(String key) {
    return box.get(key, defaultValue: null);
  }

  bool? getBool(String key) {
    return box.get(key, defaultValue: null);
  }

  double? getDouble(String key) {
    return box.get(key, defaultValue: null);
  }

  Future<void> clear() async {
    await box.clear();
  }
}
