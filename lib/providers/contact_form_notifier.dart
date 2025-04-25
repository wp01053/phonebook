import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entities/contact.dart';
import '../presentation/models/contact_form_state.dart';
import 'contact_providers.dart';

part 'contact_form_notifier.g.dart';

@riverpod
class ContactFormNotifier extends _$ContactFormNotifier {
  @override
  ContactFormState build({Contact? initial}) {
    return ContactFormState(
      mode: initial == null ? FormMode.create : FormMode.edit,
      initial: initial,
    );
  }

  /// 제출 (생성 또는 업데이트)
  Future<void> submit(Contact contact) async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      if (state.mode == FormMode.create) {
        await ref.read(addContactProvider).call(contact);
      } else {
        await ref.read(updateContactProvider).call(contact);
      }
      state = state.copyWith(isSubmitting: false);
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }

  /// 편집 모드 초기 데이터 설정
  void setInitial(Contact contact) {
    state = state.copyWith(mode: FormMode.edit, initial: contact);
  }
}
