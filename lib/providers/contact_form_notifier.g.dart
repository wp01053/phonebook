// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactFormNotifierHash() =>
    r'6a2254e236a6933536c77525d70410efbbef62e4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ContactFormNotifier
    extends BuildlessAutoDisposeNotifier<ContactFormState> {
  late final Contact? initial;

  ContactFormState build({Contact? initial});
}

/// See also [ContactFormNotifier].
@ProviderFor(ContactFormNotifier)
const contactFormNotifierProvider = ContactFormNotifierFamily();

/// See also [ContactFormNotifier].
class ContactFormNotifierFamily extends Family<ContactFormState> {
  /// See also [ContactFormNotifier].
  const ContactFormNotifierFamily();

  /// See also [ContactFormNotifier].
  ContactFormNotifierProvider call({Contact? initial}) {
    return ContactFormNotifierProvider(initial: initial);
  }

  @override
  ContactFormNotifierProvider getProviderOverride(
    covariant ContactFormNotifierProvider provider,
  ) {
    return call(initial: provider.initial);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'contactFormNotifierProvider';
}

/// See also [ContactFormNotifier].
class ContactFormNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<ContactFormNotifier, ContactFormState> {
  /// See also [ContactFormNotifier].
  ContactFormNotifierProvider({Contact? initial})
    : this._internal(
        () => ContactFormNotifier()..initial = initial,
        from: contactFormNotifierProvider,
        name: r'contactFormNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$contactFormNotifierHash,
        dependencies: ContactFormNotifierFamily._dependencies,
        allTransitiveDependencies:
            ContactFormNotifierFamily._allTransitiveDependencies,
        initial: initial,
      );

  ContactFormNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initial,
  }) : super.internal();

  final Contact? initial;

  @override
  ContactFormState runNotifierBuild(covariant ContactFormNotifier notifier) {
    return notifier.build(initial: initial);
  }

  @override
  Override overrideWith(ContactFormNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContactFormNotifierProvider._internal(
        () => create()..initial = initial,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initial: initial,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ContactFormNotifier, ContactFormState>
  createElement() {
    return _ContactFormNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContactFormNotifierProvider && other.initial == initial;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initial.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContactFormNotifierRef
    on AutoDisposeNotifierProviderRef<ContactFormState> {
  /// The parameter `initial` of this provider.
  Contact? get initial;
}

class _ContactFormNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ContactFormNotifier,
          ContactFormState
        >
    with ContactFormNotifierRef {
  _ContactFormNotifierProviderElement(super.provider);

  @override
  Contact? get initial => (origin as ContactFormNotifierProvider).initial;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
