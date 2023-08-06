import '../model/notion_block.dart';
import '../services/notion_service.dart';

class NotionRepository{

  Future<bool> postNotionTodo(String todoName)  async {
    // convert string to a notion block
    final child = NotionBlock(
        object: NotionBlockObject.BLOCK,
        type: NotionBlockType.TO_DO,
        toDo: ToDo(
            richText: [
              RichText(
                  type: RichTextType.TEXT,
                  text: RichTextText(
                      content: todoName,
                      link: null
                  )
              )
            ],
            checked: false,
            color: Color.DEFAULT
        )
    );

    //call notion API to post the block to the list
    final response = await NotionService().postShoppingItemToList(child);

    return response.statusCode == 200;
  }
}