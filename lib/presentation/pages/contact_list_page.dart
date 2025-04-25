// lib/presentation/pages/contact_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/contact.dart';
import '../../providers/contact_list_notifier.dart';
import '../models/contact_list_state.dart';
import 'widget/contact_form.dart';

class ContactListPage extends ConsumerStatefulWidget {
  const ContactListPage({super.key});

  @override
  ConsumerState<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends ConsumerState<ContactListPage> {
  final ScrollController _scrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(() {
      final pos = _scrollCtrl.position;
      final state = ref.read(contactListNotifierProvider).value!;
      if (pos.atEdge &&
          pos.pixels == pos.maxScrollExtent &&
          state.hasMore &&
          !state.isLoadingMore) {
        ref.read(contactListNotifierProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  Future<void> _showForm({Contact? initial}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return ContactForm(
          initial: initial,
          onSubmit: (contact) {
            final notifier = ref.read(contactListNotifierProvider.notifier);
            if (initial == null) {
              notifier.addContact(contact);
              // 스크롤 맨 위로
              if (_scrollCtrl.hasClients) {
                _scrollCtrl.animateTo(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            } else {
              notifier.updateContact(contact);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(contactListNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Address book')),
      body: asyncState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (ContactListState state) {
          return ListView.builder(
            controller: _scrollCtrl,
            itemCount: state.items.length + (state.hasMore ? 1 : 0),
            itemBuilder: (ctx, idx) {
              if (idx < state.items.length) {
                final c = state.items[idx];
                return ListTile(
                  title: Text(c.name),
                  subtitle: Text(c.phone),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _showForm(initial: c),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed:
                            () => ref
                                .read(contactListNotifierProvider.notifier)
                                .deleteContact(c.id),
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child:
                        state.isLoadingMore
                            ? const CircularProgressIndicator()
                            : const Text('더 이상 데이터가 없습니다'),
                  ),
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
