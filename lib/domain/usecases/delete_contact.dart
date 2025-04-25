import '../repositories/contact_repository.dart';

/// 연락처를 삭제하는 UseCase
class DeleteContact {
  final ContactRepository repository;
  DeleteContact(this.repository);

  Future<void> call(String id) {
    return repository.deleteContact(id);
  }
}
