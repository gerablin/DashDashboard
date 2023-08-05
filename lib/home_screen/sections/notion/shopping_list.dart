import 'package:dash_dashboard/model/notion_block.dart' as notion;
import 'package:dash_dashboard/providers/notion_repository.dart';
import 'package:dash_dashboard/services/notion_service.dart';
import 'package:dash_dashboard/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            child: SizedBox(
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
            ),
          ),
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

class ShoppingListTitle extends StatelessWidget {
  const ShoppingListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleMedium,
          "Einkaufsliste",
        ),
        const Padding(
            padding: EdgeInsets.only(left: 24.0), child: AddItemButton()),
      ],
    );
  }
}

class AddItemButton extends ConsumerStatefulWidget {
  const AddItemButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddItemButtonState();
}

class AddItemButtonState extends ConsumerState<AddItemButton> {
  void onClick() async {
    // open dialog to add new entry

    // add new entry
    await NotionService().postShoppingItemToList();
    ref.refresh(shoppingList);
    //retrieve new list
  }

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
