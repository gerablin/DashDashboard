import 'dart:convert';

class NotionBlock {
  final NotionBlockObject? object;
  final String? id;
  final Parent? parent;
  final DateTime? createdTime;
  final DateTime? lastEditedTime;
  final UpdatedBy? createdBy;
  final UpdatedBy? lastEditedBy;
  final bool? hasChildren;
  final bool? archived;
  final NotionBlockType? type;
  final Paragraph? paragraph;
  final Heading3? heading3;
  final Divider? divider;
  final ToDo? toDo;

  NotionBlock({
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

  NotionBlock copyWith({
    NotionBlockObject? object,
    String? id,
    Parent? parent,
    DateTime? createdTime,
    DateTime? lastEditedTime,
    UpdatedBy? createdBy,
    UpdatedBy? lastEditedBy,
    bool? hasChildren,
    bool? archived,
    NotionBlockType? type,
    Paragraph? paragraph,
    Heading3? heading3,
    Divider? divider,
    ToDo? toDo,
  }) =>
      NotionBlock(
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

  factory NotionBlock.fromRawJson(String str) =>
      NotionBlock.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotionBlock.fromJson(Map<String, dynamic> json) => NotionBlock(
        object: notionBlockObjectValues.map[json["object"]]!,
        id: json["id"],
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
        createdTime: json["created_time"] == null
            ? null
            : DateTime.parse(json["created_time"]),
        lastEditedTime: json["last_edited_time"] == null
            ? null
            : DateTime.parse(json["last_edited_time"]),
        createdBy: json["created_by"] == null
            ? null
            : UpdatedBy.fromJson(json["created_by"]),
        lastEditedBy: json["last_edited_by"] == null
            ? null
            : UpdatedBy.fromJson(json["last_edited_by"]),
        hasChildren: json["has_children"],
        archived: json["archived"],
        type: notionBlockTypeValues.map[json["type"]]!,
        paragraph: json["paragraph"] == null
            ? null
            : Paragraph.fromJson(json["paragraph"]),
        heading3: json["heading_3"] == null
            ? null
            : Heading3.fromJson(json["heading_3"]),
        divider:
            json["divider"] == null ? null : Divider.fromJson(json["divider"]),
        toDo: json["to_do"] == null ? null : ToDo.fromJson(json["to_do"]),
      );

  Map<String, dynamic> toJson() => {
        "object": notionBlockObjectValues.reverse[object],
        "id": id,
        "parent": parent?.toJson(),
        "created_time": createdTime?.toIso8601String(),
        "last_edited_time": lastEditedTime?.toIso8601String(),
        "created_by": createdBy?.toJson(),
        "last_edited_by": lastEditedBy?.toJson(),
        "has_children": hasChildren,
        "archived": archived,
        "type": notionBlockTypeValues.reverse[type],
        "paragraph": paragraph?.toJson(),
        "heading_3": heading3?.toJson(),
        "divider": divider?.toJson(),
        "to_do": toDo?.toJson(),
      };
}

class UpdatedBy {
  final CreatedByObject? object;
  final String? id;

  UpdatedBy({
    this.object,
    this.id,
  });

  UpdatedBy copyWith({
    CreatedByObject? object,
    String? id,
  }) =>
      UpdatedBy(
        object: object ?? this.object,
        id: id ?? this.id,
      );

  factory UpdatedBy.fromRawJson(String str) => UpdatedBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdatedBy.fromJson(Map<String, dynamic> json) => UpdatedBy(
        object: createdByObjectValues.map[json["object"]]!,
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "object": createdByObjectValues.reverse[object],
        "id": id,
      };
}

enum CreatedByObject { USER }

final createdByObjectValues = EnumValues({"user": CreatedByObject.USER});

class Divider {
  Divider();

  factory Divider.fromRawJson(String str) => Divider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Divider.fromJson(Map<String, dynamic> json) => Divider();

  Map<String, dynamic> toJson() => {};
}

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

  factory Heading3.fromRawJson(String str) =>
      Heading3.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Heading3.fromJson(Map<String, dynamic> json) => Heading3(
        richText: json["rich_text"] == null
            ? []
            : List<RichText>.from(
                json["rich_text"]!.map((x) => RichText.fromJson(x))),
        isToggleable: json["is_toggleable"],
        color: colorValues.map[json["color"]]!,
      );

  Map<String, dynamic> toJson() => {
        "rich_text": richText == null
            ? []
            : List<dynamic>.from(richText!.map((x) => x.toJson())),
        "is_toggleable": isToggleable,
        "color": colorValues.reverse[color],
      };
}

enum Color { DEFAULT }

final colorValues = EnumValues({"default": Color.DEFAULT});

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

  factory RichText.fromRawJson(String str) =>
      RichText.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RichText.fromJson(Map<String, dynamic> json) => RichText(
        type: richTextTypeValues.map[json["type"]]!,
        text: json["text"] == null ? null : Text.fromJson(json["text"]),
        annotations: json["annotations"] == null
            ? null
            : Annotations.fromJson(json["annotations"]),
        plainText: json["plain_text"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "type": richTextTypeValues.reverse[type],
        "text": text?.toJson(),
        "annotations": annotations?.toJson(),
        "plain_text": plainText,
        "href": href,
      };
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

  factory Annotations.fromRawJson(String str) =>
      Annotations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Annotations.fromJson(Map<String, dynamic> json) => Annotations(
        bold: json["bold"],
        italic: json["italic"],
        strikethrough: json["strikethrough"],
        underline: json["underline"],
        code: json["code"],
        color: colorValues.map[json["color"]]!,
      );

  Map<String, dynamic> toJson() => {
        "bold": bold,
        "italic": italic,
        "strikethrough": strikethrough,
        "underline": underline,
        "code": code,
        "color": colorValues.reverse[color],
      };
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

  factory Text.fromRawJson(String str) => Text.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        content: json["content"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "link": link,
      };
}

enum RichTextType { TEXT }

final richTextTypeValues = EnumValues({"text": RichTextType.TEXT});

enum NotionBlockObject { BLOCK }

final notionBlockObjectValues = EnumValues({"block": NotionBlockObject.BLOCK});

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

  factory Paragraph.fromRawJson(String str) =>
      Paragraph.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paragraph.fromJson(Map<String, dynamic> json) => Paragraph(
        richText: json["rich_text"] == null
            ? []
            : List<RichText>.from(
                json["rich_text"]!.map((x) => RichText.fromJson(x))),
        color: colorValues.map[json["color"]]!,
      );

  Map<String, dynamic> toJson() => {
        "rich_text": richText == null
            ? []
            : List<dynamic>.from(richText!.map((x) => x.toJson())),
        "color": colorValues.reverse[color],
      };
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

  factory Parent.fromRawJson(String str) => Parent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        type: parentTypeValues.map[json["type"]]!,
        pageId: json["page_id"],
      );

  Map<String, dynamic> toJson() => {
        "type": parentTypeValues.reverse[type],
        "page_id": pageId,
      };
}

enum ParentType { PAGE_ID }

final parentTypeValues = EnumValues({"page_id": ParentType.PAGE_ID});

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

  factory ToDo.fromRawJson(String str) => ToDo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        richText: json["rich_text"] == null
            ? []
            : List<RichText>.from(
                json["rich_text"]!.map((x) => RichText.fromJson(x))),
        checked: json["checked"],
        color: colorValues.map[json["color"]]!,
      );

  Map<String, dynamic> toJson() => {
        "rich_text": richText == null
            ? []
            : List<dynamic>.from(richText!.map((x) => x.toJson())),
        "checked": checked,
        "color": colorValues.reverse[color],
      };
}

enum NotionBlockType { PARAGRAPH, HEADING_3, DIVIDER, TO_DO }

final notionBlockTypeValues = EnumValues({
  "divider": NotionBlockType.DIVIDER,
  "heading_3": NotionBlockType.HEADING_3,
  "paragraph": NotionBlockType.PARAGRAPH,
  "to_do": NotionBlockType.TO_DO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
