// lib/presentation/widgets/contact_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/contact.dart';
import '../../../providers/contact_form_notifier.dart';
import '../../models/contact_form_state.dart';

typedef OnContactSubmitted = void Function(Contact contact);

class ContactForm extends ConsumerWidget {
  final Contact? initial;
  final OnContactSubmitted onSubmit;
  const ContactForm({Key? key, this.initial, required this.onSubmit})
    : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(contactFormNotifierProvider(initial: initial));
    final notifier = ref.read(
      contactFormNotifierProvider(initial: initial).notifier,
    );

    final nameCtrl = TextEditingController(text: initial?.name ?? '');
    final phoneCtrl = TextEditingController(text: initial?.phone ?? '');

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            state.mode == FormMode.create ? '연락처 추가' : '연락처 수정',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: nameCtrl,
            decoration: const InputDecoration(labelText: '이름'),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: phoneCtrl,
            decoration: const InputDecoration(labelText: '전화번호'),
            keyboardType: TextInputType.phone,
          ),
          if (state.errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(
              state.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          ],
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed:
                state.isSubmitting
                    ? null
                    : () async {
                      final id =
                          initial?.id ??
                          DateTime.now().millisecondsSinceEpoch.toString();
                      final contact = Contact(
                        id: id,
                        name: nameCtrl.text.trim(),
                        phone: phoneCtrl.text.trim(),
                      );
                      onSubmit(contact);
                      Navigator.of(context).pop();
                    },
            child:
                state.isSubmitting
                    ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                    : Text(state.mode == FormMode.create ? '추가' : '저장'),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
