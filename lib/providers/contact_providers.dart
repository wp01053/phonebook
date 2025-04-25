import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/datasources/contact_data_source.dart';
import '../data/repository/contact_repository_impl.dart';
import '../domain/repositories/contact_repository.dart';
import '../domain/usecases/add_contact.dart';
import '../domain/usecases/delete_contact.dart';
import '../domain/usecases/get_contacts.dart';
import '../domain/usecases/update_contact.dart';

part 'contact_providers.g.dart';

/// SharedPreferences 기반 LocalDataSource 초기화
@riverpod
Future<ContactLocalDataSource> contactLocalDataSource(Ref ref) async {
  final ds = ContactLocalDataSource();
  await ds.init();
  return ds;
}

/// Repository 구현체 등록
@riverpod
ContactRepository contactRepository(Ref ref) {
  final dsAsync = ref.watch(contactLocalDataSourceProvider);
  final ds = dsAsync.value!;
  return ContactRepositoryImpl(ds);
}

@riverpod
Future<int> countContacts(Ref ref) {
  return ref.watch(contactRepositoryProvider).countContacts();
}

///  UseCase
@riverpod
GetContacts getContacts(Ref ref) {
  return GetContacts(ref.watch(contactRepositoryProvider));
}

@riverpod
AddContact addContact(Ref ref) {
  return AddContact(ref.watch(contactRepositoryProvider));
}

@riverpod
UpdateContact updateContact(Ref ref) {
  return UpdateContact(ref.watch(contactRepositoryProvider));
}

@riverpod
DeleteContact deleteContact(Ref ref) {
  return DeleteContact(ref.watch(contactRepositoryProvider));
}
