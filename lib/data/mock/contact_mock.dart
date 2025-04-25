import '../../domain/entities/contact.dart';

/// 앱 최초 실행 시 시딩할 가상의 연락처 목록
final List<Contact> contactMockData = List.generate(100, (index) {
  final id = (index + 1).toString();
  return Contact(
    id: id,
    name: '홍길동$id',
    phone: '010-0000-${id.padLeft(4, '0')}',
  );
});
