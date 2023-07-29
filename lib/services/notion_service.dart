import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

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
}
