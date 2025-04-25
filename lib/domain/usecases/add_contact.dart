import '../entities/contact.dart';
import '../repositories/contact_repository.dart';

/// 새로운 연락처를 추가하는 UseCase
class AddContact {
  final ContactRepository repository;
  AddContact(this.repository);

  Future<void> call(Contact contact) {
    return repository.addContact(contact);
  }
}
