class NotionBlock {
  final String? object;
  final List<Result>? results;
  final dynamic nextCursor;
  final bool? hasMore;
  final ObjectEnum? type;
  final Block? block;
  final String? developerSurvey;

  NotionBlock({
    this.object,
    this.results,
    this.nextCursor,
    this.hasMore,
    this.type,
    this.block,
    this.developerSurvey,
  });

  NotionBlock copyWith({
    String? object,
    List<Result>? results,
    dynamic nextCursor,
    bool? hasMore,
    ObjectEnum? type,
    Block? block,
    String? developerSurvey,
  }) =>
      NotionBlock(
        object: object ?? this.object,
        results: results ?? this.results,
        nextCursor: nextCursor ?? this.nextCursor,
        hasMore: hasMore ?? this.hasMore,
        type: type ?? this.type,
        block: block ?? this.block,
        developerSurvey: developerSurvey ?? this.developerSurvey,
      );
}

class Block {
  Block();

  Block copyWith({
}) =>
Block(
    );
}

class Result {
  final ObjectEnum? object;
  final String? id;
  final Parent? parent;
  final DateTime? createdTime;
  final DateTime? lastEditedTime;
  final TedBy? createdBy;
  final TedBy? lastEditedBy;
  final bool? hasChildren;
  final bool? archived;
  final PurpleType? type;
  final Paragraph? paragraph;
  final Heading3? heading3;
  final Block? divider;
  final ToDo? toDo;

  Result({
    this.object,
    this.id,
    this.parent,
    this.createdTime,
    this.lastEditedTime,
    this.createdBy,
    this.lastEditedBy,
    this.hasChildren,
    this.archived,
    this.type,
    this.paragraph,
    this.heading3,
    this.divider,
    this.toDo,
  });

  Result copyWith({
    ObjectEnum? object,
    String? id,
    Parent? parent,
    DateTime? createdTime,
    DateTime? lastEditedTime,
    TedBy? createdBy,
    TedBy? lastEditedBy,
    bool? hasChildren,
    bool? archived,
    PurpleType? type,
    Paragraph? paragraph,
    Heading3? heading3,
    Block? divider,
    ToDo? toDo,
  }) =>
      Result(
        object: object ?? this.object,
        id: id ?? this.id,
        parent: parent ?? this.parent,
        createdTime: createdTime ?? this.createdTime,
        lastEditedTime: lastEditedTime ?? this.lastEditedTime,
        createdBy: createdBy ?? this.createdBy,
        lastEditedBy: lastEditedBy ?? this.lastEditedBy,
        hasChildren: hasChildren ?? this.hasChildren,
        archived: archived ?? this.archived,
        type: type ?? this.type,
        paragraph: paragraph ?? this.paragraph,
        heading3: heading3 ?? this.heading3,
        divider: divider ?? this.divider,
        toDo: toDo ?? this.toDo,
      );
}

class TedBy {
  final Object? object;
  final String? id;

  TedBy({
    this.object,
    this.id,
  });

  TedBy copyWith({
    Object? object,
    String? id,
  }) =>
      TedBy(
        object: object ?? this.object,
        id: id ?? this.id,
      );
}

enum Object { USER }

class Heading3 {
  final List<RichText>? richText;
  final bool? isToggleable;
  final Color? color;

  Heading3({
    this.richText,
    this.isToggleable,
    this.color,
  });

  Heading3 copyWith({
    List<RichText>? richText,
    bool? isToggleable,
    Color? color,
  }) =>
      Heading3(
        richText: richText ?? this.richText,
        isToggleable: isToggleable ?? this.isToggleable,
        color: color ?? this.color,
      );
}

enum Color { DEFAULT }

class RichText {
  final RichTextType? type;
  final Text? text;
  final Annotations? annotations;
  final String? plainText;
  final dynamic href;

  RichText({
    this.type,
    this.text,
    this.annotations,
    this.plainText,
    this.href,
  });

  RichText copyWith({
    RichTextType? type,
    Text? text,
    Annotations? annotations,
    String? plainText,
    dynamic href,
  }) =>
      RichText(
        type: type ?? this.type,
        text: text ?? this.text,
        annotations: annotations ?? this.annotations,
        plainText: plainText ?? this.plainText,
        href: href ?? this.href,
      );
}

class Annotations {
  final bool? bold;
  final bool? italic;
  final bool? strikethrough;
  final bool? underline;
  final bool? code;
  final Color? color;

  Annotations({
    this.bold,
    this.italic,
    this.strikethrough,
    this.underline,
    this.code,
    this.color,
  });

  Annotations copyWith({
    bool? bold,
    bool? italic,
    bool? strikethrough,
    bool? underline,
    bool? code,
    Color? color,
  }) =>
      Annotations(
        bold: bold ?? this.bold,
        italic: italic ?? this.italic,
        strikethrough: strikethrough ?? this.strikethrough,
        underline: underline ?? this.underline,
        code: code ?? this.code,
        color: color ?? this.color,
      );
}

class Text {
  final String? content;
  final dynamic link;

  Text({
    this.content,
    this.link,
  });

  Text copyWith({
    String? content,
    dynamic link,
  }) =>
      Text(
        content: content ?? this.content,
        link: link ?? this.link,
      );
}

enum RichTextType { TEXT }

enum ObjectEnum { BLOCK }

class Paragraph {
  final List<RichText>? richText;
  final Color? color;

  Paragraph({
    this.richText,
    this.color,
  });

  Paragraph copyWith({
    List<RichText>? richText,
    Color? color,
  }) =>
      Paragraph(
        richText: richText ?? this.richText,
        color: color ?? this.color,
      );
}

class Parent {
  final ParentType? type;
  final String? pageId;

  Parent({
    this.type,
    this.pageId,
  });

  Parent copyWith({
    ParentType? type,
    String? pageId,
  }) =>
      Parent(
        type: type ?? this.type,
        pageId: pageId ?? this.pageId,
      );
}

enum ParentType { PAGE_ID }

class ToDo {
  final List<RichText>? richText;
  final bool? checked;
  final Color? color;

  ToDo({
    this.richText,
    this.checked,
    this.color,
  });

  ToDo copyWith({
    List<RichText>? richText,
    bool? checked,
    Color? color,
  }) =>
      ToDo(
        richText: richText ?? this.richText,
        checked: checked ?? this.checked,
        color: color ?? this.color,
      );
}

enum PurpleType { PARAGRAPH, HEADING_3, DIVIDER, TO_DO }
