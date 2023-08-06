import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../model/notion_block.dart';

class NotionService {
  final http.Client _client;
  final baseUrl = "https://api.notion.com/v1";

  NotionService({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> requestShoppingListPage() async {
    final url =
        "$baseUrl/blocks/${dotenv.env['NOTION_SHOPPING_PAGE_ID']}/children";
    final response = await _client.get(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${dotenv.env['NOTION_API_KEY']}",
      "Notion-Version": "2022-06-28",
    });
    return response;
  }

  Future<http.Response> postShoppingItemToList(NotionBlock todo) async {
    // the id where the item will be added below
    // this is the divider below the title and above the first item on the notion page
    const notionBlockId = "08af88dd-97aa-416f-bda7-496c49c56096";
    final url = "$baseUrl/blocks/$notionBlockId/children";

    //create notion block
    String jsonData = json.encode({
      "children": [todo]
    });

    print(jsonData.toString());
    final response = await _client.patch(Uri.parse(url), headers: {
      HttpHeaders.authorizationHeader: "Bearer ${dotenv.env['NOTION_API_KEY']}",
      "Notion-Version": "2022-06-28",
      "Content-Type" : "application/json"
    }, body: jsonData);
    print(response.body);
    return response;
  }
}
