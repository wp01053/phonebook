import '../../domain/entities/contact.dart';

/// 폼 모드: 생성 or 수정
enum FormMode { create, edit }

/// 연락처 폼 상태 모델
class ContactFormState {
  final FormMode mode;
  final Contact? initial; // 수정 모드 시 초기 데이터
  final bool isSubmitting; // 제출 중 로딩 상태
  final String? errorMessage; // 에러 메시지

  ContactFormState({
    this.mode = FormMode.create,
    this.initial,
    this.isSubmitting = false,
    this.errorMessage,
  });

  ContactFormState copyWith({
    FormMode? mode,
    Contact? initial,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return ContactFormState(
      mode: mode ?? this.mode,
      initial: initial ?? this.initial,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }
}
