import '../entities/contact.dart';
import '../repositories/contact_repository.dart';

/// 연락처 목록을 페이지 단위로 가져오는 UseCase
class GetContacts {
  final ContactRepository repository;
  GetContacts(this.repository);

  Future<List<Contact>> call({required int page, required int limit}) {
    return repository.fetchContacts(page: page, limit: limit);
  }
}
