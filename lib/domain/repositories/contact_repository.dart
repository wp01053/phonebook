import '../entities/contact.dart';

abstract class ContactRepository {
  /// 페이지 단위로 연락처 리스트 패치
  Future<List<Contact>> fetchContacts({required int page, required int limit});

  /// 새 연락처를 추가합니다.
  Future<void> addContact(Contact contact);

  /// 기존 연락처를 수정합니다.
  Future<void> updateContact(Contact contact);

  /// 연락처를 삭제합니다.
  Future<void> deleteContact(String id);

  /// 전체 연락처 개수 반환
  Future<int> countContacts();
}
