import '../entities/contact.dart';
import '../repositories/contact_repository.dart';

/// 기존 연락처를 수정하는 UseCase
class UpdateContact {
  final ContactRepository repository;
  UpdateContact(this.repository);

  Future<void> call(Contact contact) {
    return repository.updateContact(contact);
  }
}
