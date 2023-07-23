import 'package:dash_dashboard/services/notion_service.dart';
import 'package:flutter/material.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key});

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {

  @override
  void initState() {
    super.initState();
    NotionService().requestShoppingListPage();
  }
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: []),
    );
  }
}
