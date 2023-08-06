import 'dart:convert';
import 'package:dash_dashboard/model/notion_block.dart';
import 'package:dash_dashboard/services/notion_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final shoppingList = FutureProvider<List<NotionBlock>>((ref) async {
  List items = List.empty();
  final response = await NotionService().requestShoppingListPage();
  items = json.decode(response.body)["results"];
  return items
      .map((notionBlock) => NotionBlock.fromJson(notionBlock))
      .toList()
      .where((element) => element.toDo != null).toList();
});