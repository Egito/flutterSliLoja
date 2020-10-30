// To parse this JSON data, do
//
//     final cceProdutoModel = cceProdutoModelFromMap(jsonString);

import 'dart:convert';

class CceProdutoModel {
  CceProdutoModel({
    this.id,
    this.descr,
    this.abrev,
    this.imagemUrl,
    this.preco,
    this.updatedAt,
    this.cceCategoria,
  });

  final String id;
  final String descr;
  final String abrev;
  final String imagemUrl;
  final double preco;
  final DateTime updatedAt;
  final CceCategoria cceCategoria;

  CceProdutoModel copyWith({
    String id,
    String descr,
    String abrev,
    String imagemUrl,
    double preco,
    DateTime updatedAt,
    CceCategoria cceCategoria,
  }) =>
      CceProdutoModel(
        id: id ?? this.id,
        descr: descr ?? this.descr,
        abrev: abrev ?? this.abrev,
        imagemUrl: imagemUrl ?? this.imagemUrl,
        preco: preco ?? this.preco,
        updatedAt: updatedAt ?? this.updatedAt,
        cceCategoria: cceCategoria ?? this.cceCategoria,
      );

  factory CceProdutoModel.fromJson(String str) =>
      CceProdutoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CceProdutoModel.fromMap(Map<String, dynamic> json) => CceProdutoModel(
        id: json["id"],
        descr: json["descr"],
        abrev: json["abrev"],
        imagemUrl: json["imagemUrl"],
        preco: json["preco"].toDouble(),
        updatedAt: DateTime.parse(json["updated_at"]),
        cceCategoria: CceCategoria.fromMap(json["cce_categoria"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "descr": descr,
        "abrev": abrev,
        "imagemUrl": imagemUrl,
        "preco": preco,
        "updated_at": updatedAt.toIso8601String(),
        "cce_categoria": cceCategoria.toMap(),
      };

  static List<CceProdutoModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<CceProdutoModel>((e) => CceProdutoModel.fromMap(e))
        .toList();
  }
}

class CceCategoria {
  CceCategoria({
    this.descr,
    this.id,
  });

  final String descr;
  final String id;

  CceCategoria copyWith({
    String descr,
    String id,
  }) =>
      CceCategoria(
        descr: descr ?? this.descr,
        id: id ?? this.id,
      );

  factory CceCategoria.fromJson(String str) =>
      CceCategoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CceCategoria.fromMap(Map<String, dynamic> json) => CceCategoria(
        descr: json["descr"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "descr": descr,
        "id": id,
      };
}
