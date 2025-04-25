import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/contact.dart';
import '../mock/contact_mock.dart';

class ContactLocalDataSource {
  static const _contactsKey = 'contacts';

  late SharedPreferences _prefs;
  List<Contact> _cache = [];

  /// 호출 직후 한 번만 SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final jsonString = _prefs.getString(_contactsKey);
    if (jsonString == null) {
      // 최초 실행: mock
      _cache = contactMockData;
      await _saveCache();
    } else {
      _cache = contactMockData;
      await _saveCache();
      // 기존에 저장된 JSON 불러오기
      // final List<dynamic> decoded = jsonDecode(jsonString);
      // _cache =
      //     decoded
      //         .map((e) => Contact.fromJson(e as Map<String, dynamic>))
      //         .toList();
    }
  }

  /// 전체 리스트에서 페이징 처리된 서브리스트 반환
  List<Contact> getAll({required int page, required int limit}) {
    final start = (page - 1) * limit;
    if (start >= _cache.length) return [];
    return _cache.skip(start).take(limit).toList();
  }

  Future<void> add(Contact c) async {
    _cache.insert(0, c);
    await _saveCache();
  }

  Future<void> update(Contact c) async {
    final idx = _cache.indexWhere((e) => e.id == c.id);
    if (idx != -1) {
      _cache[idx] = c;
      await _saveCache();
    }
  }

  Future<void> delete(String id) async {
    _cache.removeWhere((e) => e.id == id);
    await _saveCache();
  }

  /// 메모리 캐시를 SharedPreferences 에 JSON 으로 저장
  Future<void> _saveCache() async {
    final jsonString = jsonEncode(_cache.map((e) => e.toJson()).toList());
    await _prefs.setString(_contactsKey, jsonString);
  }

  /// 전체 연락처 개수 반환
  int count() => _cache.length;
}
