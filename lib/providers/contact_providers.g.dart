// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactLocalDataSourceHash() =>
    r'6283572cd5d087896526221d46cee07a0d5620f1';

/// SharedPreferences 기반 LocalDataSource 초기화
///
/// Copied from [contactLocalDataSource].
@ProviderFor(contactLocalDataSource)
final contactLocalDataSourceProvider =
    AutoDisposeFutureProvider<ContactLocalDataSource>.internal(
      contactLocalDataSource,
      name: r'contactLocalDataSourceProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$contactLocalDataSourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ContactLocalDataSourceRef =
    AutoDisposeFutureProviderRef<ContactLocalDataSource>;
String _$contactRepositoryHash() => r'383144543ecc3228c44f4b9f72eb93216f339c27';

/// Repository 구현체 등록
///
/// Copied from [contactRepository].
@ProviderFor(contactRepository)
final contactRepositoryProvider =
    AutoDisposeProvider<ContactRepository>.internal(
      contactRepository,
      name: r'contactRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$contactRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ContactRepositoryRef = AutoDisposeProviderRef<ContactRepository>;
String _$countContactsHash() => r'7aedfa1ded13e1fcc0080f7cc6c30d462accac9e';

/// See also [countContacts].
@ProviderFor(countContacts)
final countContactsProvider = AutoDisposeFutureProvider<int>.internal(
  countContacts,
  name: r'countContactsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$countContactsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CountContactsRef = AutoDisposeFutureProviderRef<int>;
String _$getContactsHash() => r'ec3510f4b21769c7914e85e23fcdb5954e944e8d';

///  UseCase
///
/// Copied from [getContacts].
@ProviderFor(getContacts)
final getContactsProvider = AutoDisposeProvider<GetContacts>.internal(
  getContacts,
  name: r'getContactsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getContactsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetContactsRef = AutoDisposeProviderRef<GetContacts>;
String _$addContactHash() => r'86649583c752863c24831597b0fee9594bb85090';

/// See also [addContact].
@ProviderFor(addContact)
final addContactProvider = AutoDisposeProvider<AddContact>.internal(
  addContact,
  name: r'addContactProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addContactHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddContactRef = AutoDisposeProviderRef<AddContact>;
String _$updateContactHash() => r'f313125b3b43ea670263b2a4496ae784a1fa3cb9';

/// See also [updateContact].
@ProviderFor(updateContact)
final updateContactProvider = AutoDisposeProvider<UpdateContact>.internal(
  updateContact,
  name: r'updateContactProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updateContactHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdateContactRef = AutoDisposeProviderRef<UpdateContact>;
String _$deleteContactHash() => r'7d26d9bedf1a15ce6f3e2ff6eaa7ba646838eb71';

/// See also [deleteContact].
@ProviderFor(deleteContact)
final deleteContactProvider = AutoDisposeProvider<DeleteContact>.internal(
  deleteContact,
  name: r'deleteContactProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$deleteContactHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeleteContactRef = AutoDisposeProviderRef<DeleteContact>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
