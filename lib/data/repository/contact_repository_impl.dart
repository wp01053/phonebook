import '../../domain/entities/contact.dart';
import '../../domain/repositories/contact_repository.dart';
import '../datasources/contact_data_source.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactLocalDataSource localDataSource;

  ContactRepositoryImpl(this.localDataSource);

  @override
  Future<List<Contact>> fetchContacts({
    required int page,
    required int limit,
  }) => Future.value(localDataSource.getAll(page: page, limit: limit));

  @override
  Future<void> addContact(Contact contact) => localDataSource.add(contact);

  @override
  Future<void> updateContact(Contact contact) =>
      localDataSource.update(contact);

  @override
  Future<void> deleteContact(String id) => localDataSource.delete(id);

  @override
  Future<int> countContacts() => Future.value(localDataSource.count());
}
