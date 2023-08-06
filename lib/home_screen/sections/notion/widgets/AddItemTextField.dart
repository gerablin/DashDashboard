import 'package:dash_dashboard/home_screen/sections/notion/shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/notion_provider.dart';
import '../../../../repositories/notion_repository.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/size_config.dart';

class AddItemTextField  extends ConsumerStatefulWidget {
  const AddItemTextField({super.key});

  @override
  ConsumerState<AddItemTextField> createState() => _AddItemTextField2State();
}

class _AddItemTextField2State extends ConsumerState<AddItemTextField> {
  final textEditingController = TextEditingController();

  Future<void> itemButtonOnClick() async {
    await NotionRepository().postNotionTodo(textEditingController.text);
    // retrieve new list
    ref.refresh(shoppingList);
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Row(
        children: [
          AddItemTextFieldInput(textEditingController: textEditingController,),
          AddItemButton(onClick: itemButtonOnClick)
        ],
      ),
    );
  }
}

class AddItemTextFieldInput extends ConsumerStatefulWidget {
  final TextEditingController textEditingController;

  const AddItemTextFieldInput({super.key, required this.textEditingController});

  @override
  ConsumerState<AddItemTextFieldInput> createState() => _AddItemTextFieldState();
}

class _AddItemTextFieldState extends ConsumerState<AddItemTextFieldInput> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.blockSizeHorizontal * 20,
      child: TextField(
        controller: widget.textEditingController,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          labelText: 'add item',
          contentPadding: EdgeInsets.zero,
          labelStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.primaryColor, fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}