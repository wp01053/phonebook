import '../../domain/entities/contact.dart';

/// 연락처 목록 페이지 상태 모델
class ContactListState {
  /// 현재 로드된 연락처 리스트
  final List<Contact> items;

  /// 더 불러올 데이터가 남았는지 여부
  final bool hasMore;

  /// 현재 페이지 번호 (1부터 시작)
  final int page;

  final bool isLoadingMore;

  const ContactListState({
    this.items = const [],
    this.hasMore = true,
    this.page = 1,
    this.isLoadingMore = false,
  });

  ContactListState copyWith({
    List<Contact>? items,
    bool? hasMore,
    int? page,
    bool? isLoadingMore,
  }) {
    return ContactListState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
