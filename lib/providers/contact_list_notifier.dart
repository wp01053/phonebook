import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/contact.dart';
import '../presentation/models/contact_list_state.dart';
import 'contact_providers.dart';

part 'contact_list_notifier.g.dart';

@riverpod
class ContactListNotifier extends _$ContactListNotifier {
  static const _limit = 20;

  /// 앱 시작과 Notifier 생성 시 초기 페이지 로드
  @override
  Future<ContactListState> build() async {
    final list = await ref
        .watch(getContactsProvider)
        .call(page: 1, limit: _limit);
    final total = await ref.watch(countContactsProvider.future);

    return ContactListState(
      items: list,
      hasMore: 1 * _limit < total,
      page: 1,
      isLoadingMore: false,
    );
  }

  /// 목록 초기화 및 새로고침
  Future<void> loadInitial() async {
    state = const AsyncValue.loading();
    try {
      final newState = await build();
      state = AsyncValue.data(newState);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// 다음 페이지 로드 (페이징)
  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));

    final nextPage = current.page + 1;
    final newItems = await ref
        .watch(getContactsProvider)
        .call(page: nextPage, limit: _limit);

    final totalCount =
        await ref.read(contactRepositoryProvider).countContacts();

    final hasMore = nextPage * _limit < totalCount;

    state = AsyncValue.data(
      current.copyWith(
        items: [...current.items, ...newItems],
        hasMore: hasMore,
        page: nextPage,
        isLoadingMore: false,
      ),
    );
  }

  /// 연락처 추가: 현재 페이지 items 앞에 추가
  Future<void> addContact(Contact contact) async {
    await ref.watch(addContactProvider).call(contact);

    final current = state.value;
    if (current == null) return;
    final total = await ref.watch(countContactsProvider.future);
    final hasMore = current.page * _limit < total;

    state = AsyncValue.data(current.copyWith(hasMore: hasMore));
  }

  /// 연락처 수정: 현재 items에서 교체
  Future<void> updateContact(Contact contact) async {
    await ref.watch(updateContactProvider).call(contact);
    final current = state.value;
    if (current == null) return;
    final newItems =
        current.items.map((c) => c.id == contact.id ? contact : c).toList();
    state = AsyncValue.data(current.copyWith(items: newItems));
  }

  /// 연락처 삭제: 현재 items에서 제거만, 페이지/hasMore 유지
  Future<void> deleteContact(String id) async {
    await ref.watch(deleteContactProvider).call(id);
    final current = state.value;
    if (current == null) return;
    final newItems = current.items.where((c) => c.id != id).toList();
    state = AsyncValue.data(current.copyWith(items: newItems));
  }
}
