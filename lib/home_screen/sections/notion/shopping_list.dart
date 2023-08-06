import 'package:dash_dashboard/home_screen/sections/notion/widgets/AddItemTextField.dart';
import 'package:dash_dashboard/model/notion_block.dart' as notion;
import 'package:dash_dashboard/providers/notion_provider.dart';
import 'package:dash_dashboard/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../model/notion_block.dart';
import '../../../utils/app_colors.dart';

class ShoppingList extends ConsumerWidget {
  const ShoppingList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<notion.NotionBlock>> todos = ref.watch(shoppingList);

    return todos.when(
      data: (todos) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: ShoppingListTitle(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: ShoppingListScrollView(todos: todos),
          ),
          const AddItemTextField()
        ],
      ),
      error: (err, stack) => Text(
        'Error: $err',
        style: const TextStyle(fontSize: 20, color: Colors.red),
      ),
      loading: () => const CircularProgressIndicator(),
    );
  }
}


class ShoppingListScrollView extends StatelessWidget {
  const ShoppingListScrollView({super.key, required this.todos});

  final List<NotionBlock> todos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.blockSizeVertical * 35,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...todos.map((todo) => ShoppingItem(
                text: todo.toDo?.richText?.first.plainText ??
                    "Internal parsing error")),
          ],
        ),
      ),
    );
  }
}

class ShoppingListTitle extends StatelessWidget {
  const ShoppingListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.titleMedium,
      "Einkaufsliste",
    );
  }
}

class AddItemButton extends StatelessWidget {
  const AddItemButton({super.key, required this.onClick});

  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: const FaIcon(
        FontAwesomeIcons.cartPlus,
        color: AppColors.white,
      ),
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
    return Text(
      text,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
