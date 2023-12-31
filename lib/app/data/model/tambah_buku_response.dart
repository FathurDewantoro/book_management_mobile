// To parse this JSON data, do
//
//     final tambahBukuResponse = tambahBukuResponseFromJson(jsonString);

import 'dart:convert';

TambahBukuResponse tambahBukuResponseFromJson(String str) =>
    TambahBukuResponse.fromJson(json.decode(str));

String tambahBukuResponseToJson(TambahBukuResponse data) =>
    json.encode(data.toJson());

class TambahBukuResponse {
  String? message;
  Book? book;

  TambahBukuResponse({
    this.message,
    this.book,
  });

  factory TambahBukuResponse.fromJson(Map<String, dynamic> json) =>
      TambahBukuResponse(
        message: json["message"],
        book: json["book"] == null ? null : Book.fromJson(json["book"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "book": book?.toJson(),
      };
}

class Book {
  String? isbn;
  String? title;
  String? subtitle;
  String? author;
  DateTime? published;
  String? publisher;
  int? pages;
  String? description;
  String? website;
  int? userId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Book({
    this.isbn,
    this.title,
    this.subtitle,
    this.author,
    this.published,
    this.publisher,
    this.pages,
    this.description,
    this.website,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        isbn: json["isbn"],
        title: json["title"],
        subtitle: json["subtitle"],
        author: json["author"],
        published: json["published"] == null
            ? null
            : DateTime.parse(json["published"]),
        publisher: json["publisher"],
        pages: json["pages"],
        description: json["description"],
        website: json["website"],
        userId: json["user_id"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "isbn": isbn,
        "title": title,
        "subtitle": subtitle,
        "author": author,
        "published": published?.toIso8601String(),
        "publisher": publisher,
        "pages": pages,
        "description": description,
        "website": website,
        "user_id": userId,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
