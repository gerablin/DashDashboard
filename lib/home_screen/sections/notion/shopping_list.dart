import 'package:dash_dashboard/model/notion_block.dart' as notion;
import 'package:dash_dashboard/providers/notion_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingList extends ConsumerWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<notion.NotionBlock>> todos = ref.watch(shoppingList);

    return todos.when(
      data: (todos) =>
        SingleChildScrollView(
        child: Column(children: [
          ...todos.map((todo) =>ShoppingItem(text: todo.toDo?.richText?.first.plainText ?? "Internal parsing error") ),
        ],),
      ),
      error: (err, stack) =>
          Text('Error: $err',
            style: const TextStyle(fontSize: 20, color: Colors.red),),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

class ShoppingItem extends StatelessWidget {
  final String text;
  const ShoppingItem({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
