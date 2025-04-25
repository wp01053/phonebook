import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonebook/presentation/pages/contact_list_page.dart';
import 'package:phonebook/providers/contact_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  await container.read(contactLocalDataSourceProvider.future);

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AddressBook App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ContactListPage(),
    );
  }
}
