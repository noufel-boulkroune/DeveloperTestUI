import 'package:meta/meta.dart';
import 'dart:convert';

List<UsersDataModel> usersDataModelFromMap(String str) =>
    List<UsersDataModel>.from(
        json.decode(str).map((x) => UsersDataModel.fromMap(x)));

String usersDataModelToMap(List<UsersDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class UsersDataModel {
  UsersDataModel({
    required this.id,
    required this.caption,
    required this.media,
    required this.createdAt,
    required this.author,
    required this.spot,
    required this.relevantComments,
    required this.numberOfComments,
    required this.likedBy,
    required this.numberOfLikes,
    required this.tags,
    required this.url,
  });

  final String id;
  final Caption caption;
  final List<Media> media;
  final DateTime createdAt;
  final Author author;
  final Spot spot;
  final dynamic relevantComments;
  final int numberOfComments;
  final List<Author>? likedBy;
  final int numberOfLikes;
  final dynamic tags;
  final String url;

  factory UsersDataModel.fromMap(Map<String, dynamic> json) => UsersDataModel(
        id: json["id"],
        caption: Caption.fromMap(json["caption"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromMap(x))),
        createdAt: DateTime.parse(json["created_at"]),
        author: Author.fromMap(json["author"]),
        spot: Spot.fromMap(json["spot"]),
        relevantComments: json["relevant_comments"],
        numberOfComments: json["number_of_comments"],
        likedBy: json["liked_by"] == null || json["liked_by"] == []
            ? null
            : List<Author>.from(json["liked_by"].map((x) => Author.fromMap(x))),
        numberOfLikes: json["number_of_likes"],
        tags: json["tags"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "caption": caption.toMap(),
        "media": List<dynamic>.from(media.map((x) => x.toMap())),
        "created_at": createdAt.toIso8601String(),
        "author": author.toMap(),
        "spot": spot.toMap(),
        "relevant_comments": relevantComments,
        "number_of_comments": numberOfComments,
        "liked_by": likedBy == null || likedBy == []
            ? []
            : List<dynamic>.from(likedBy!.map((x) => x.toMap())),
        "number_of_likes": numberOfLikes,
        "tags": tags,
        "url": url,
      };
}

class Author {
  Author({
    required this.id,
    required this.username,
    required this.photoUrl,
    required this.fullName,
    required this.isPrivate,
    required this.isVerified,
    required this.followStatus,
  });

  final String id;
  final String username;
  final String photoUrl;
  final String fullName;
  final bool isPrivate;
  final bool isVerified;
  final String followStatus;

  factory Author.fromMap(Map<String, dynamic> json) => Author(
        id: json["id"],
        username: json["username"],
        photoUrl: json["photo_url"],
        fullName: json["full_name"],
        isPrivate: json["is_private"],
        isVerified: json["is_verified"],
        followStatus:
            json["follow_status"] == null || json["follow_status"] == ""
                ? ""
                : json["follow_status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "photo_url": photoUrl,
        "full_name": fullName,
        "is_private": isPrivate,
        "is_verified": isVerified,
        "follow_status":
            followStatus == null || followStatus == "" ? "" : followStatus,
      };
}

class Caption {
  Caption({
    required this.text,
    required this.tags,
  });

  final String text;
  final List<Tag>? tags;

  factory Caption.fromMap(Map<String, dynamic> json) => Caption(
        text: json["text"],
        tags: json["tags"] == null || json["tags"] == []
            ? []
            : List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "tags": tags == null || tags == []
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toMap())),
      };
}

class Tag {
  Tag({
    required this.id,
    required this.tagText,
    required this.displayText,
    required this.url,
    required this.type,
  });

  final String id;
  final String tagText;
  final String displayText;
  final String url;
  final String type;

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"],
        tagText: json["tag_text"],
        displayText: json["display_text"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tag_text": tagText,
        "display_text": displayText,
        "url": url,
        "type": type,
      };
}

class Media {
  Media({
    required this.url,
    required this.blurHash,
    required this.type,
  });

  final String url;
  final String blurHash;
  final TypeEnum? type;

  factory Media.fromMap(Map<String, dynamic> json) => Media(
        url: json["url"],
        blurHash: json["blur_hash"] == null || json["blur_hash"] == ""
            ? ""
            : json["blur_hash"],
        type: typeEnumValues.map[json["type"]],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "blur_hash": blurHash == null || blurHash == "" ? "" : blurHash,
        "type": typeEnumValues.reverse[type],
      };
}

enum TypeEnum { IMAGE }

final typeEnumValues = EnumValues({"image": TypeEnum.IMAGE});

class Spot {
  Spot({
    required this.id,
    required this.name,
    required this.types,
    required this.logo,
    required this.location,
    required this.isSaved,
  });

  final String id;
  final String name;
  final List<TypeElement> types;
  final Media logo;
  final Location location;
  bool isSaved;

  factory Spot.fromMap(Map<String, dynamic> json) => Spot(
        id: json["id"],
        name: json["name"],
        types: List<TypeElement>.from(
            json["types"].map((x) => TypeElement.fromMap(x))),
        logo: Media.fromMap(json["logo"]),
        location: Location.fromMap(json["location"]),
        isSaved: json["is_saved"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "types": List<dynamic>.from(types.map((x) => x.toMap())),
        "logo": logo.toMap(),
        "location": location.toMap(),
        "is_saved": isSaved,
      };
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
    required this.display,
  });

  final double latitude;
  final double longitude;
  final String display;

  factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        display: json["display"],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "display": display,
      };
}

class TypeElement {
  TypeElement({
    required this.id,
    required this.name,
    required this.url,
  });

  final int id;
  final String name;
  final String url;

  factory TypeElement.fromMap(Map<String, dynamic> json) => TypeElement(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}






// // To parse this JSON data, do
// //
// //     final usersDataModel = usersDataModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<UsersDataModel> usersDataModelFromJson(String str) =>
//     List<UsersDataModel>.from(
//         json.decode(str).map((x) => UsersDataModel.fromJson(x)));

// String usersDataModelToJson(List<UsersDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UsersDataModel {
//   UsersDataModel({
//     required this.id,
//     required this.caption,
//     required this.media,
//     required this.createdAt,
//     required this.author,
//     required this.spot,
//     required this.relevantComments,
//     required this.numberOfComments,
//     required this.likedBy,
//     required this.numberOfLikes,
//     required this.tags,
//     required this.url,
//   });

//   final String id;
//   final Caption caption;
//   final List<Media> media;
//   final DateTime createdAt;
//   final Author author;
//   final Spot spot;
//   final dynamic relevantComments;
//   final int numberOfComments;
//   final List<Author>? likedBy;
//   final int numberOfLikes;
//   final dynamic tags;
//   final String url;

//   factory UsersDataModel.fromJson(Map<String, dynamic> json) => UsersDataModel(
//         id: json["id"],
//         caption: Caption.fromJson(json["caption"]),
//         media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
//         createdAt: DateTime.parse(json["created_at"]),
//         author: Author.fromJson(json["author"]),
//         spot: Spot.fromJson(json["spot"]),
//         relevantComments: json["relevant_comments"],
//         numberOfComments: json["number_of_comments"],
//         likedBy: json["liked_by"] == null
//             ? null
//             : List<Author>.from(
//                 json["liked_by"].map((x) => Author.fromJson(x))),
//         numberOfLikes: json["number_of_likes"],
//         tags: json["tags"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "caption": caption.toJson(),
//         "media": List<dynamic>.from(media.map((x) => x.toJson())),
//         "created_at": createdAt.toIso8601String(),
//         "author": author.toJson(),
//         "spot": spot.toJson(),
//         "relevant_comments": relevantComments,
//         "number_of_comments": numberOfComments,
//         "liked_by": likedBy == null
//             ? null
//             : List<dynamic>.from(likedBy!.map((x) => x.toJson())),
//         "number_of_likes": numberOfLikes,
//         "tags": tags,
//         "url": url,
//       };
// }

// class Author {
//   Author({
//     required this.id,
//     required this.username,
//     required this.photoUrl,
//     required this.fullName,
//     required this.isPrivate,
//     required this.isVerified,
//     required this.followStatus,
//   });

//   final String id;
//   final String username;
//   final String photoUrl;
//   final String fullName;
//   final bool isPrivate;
//   final bool isVerified;
//   final String followStatus;

//   factory Author.fromJson(Map<String, dynamic> json) => Author(
//         id: json["id"],
//         username: json["username"],
//         photoUrl: json["photo_url"],
//         fullName: json["full_name"],
//         isPrivate: json["is_private"],
//         isVerified: json["is_verified"],
//         followStatus:
//             json["follow_status"] == null || json["follow_status"] == ""
//                 ? ""
//                 : json["follow_status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": username,
//         "photo_url": photoUrl,
//         "full_name": fullName,
//         "is_private": isPrivate,
//         "is_verified": isVerified,
//         "follow_status":
//             followStatus == null || followStatus == "" ? "" : followStatus,
//       };
// }

// class Caption {
//   Caption({
//     required this.text,
//     required this.tags,
//   });

//   final String text;
//   final List<Tag>? tags;

//   factory Caption.fromJson(Map<String, dynamic> json) => Caption(
//         text: json["text"],
//         tags: json["tags"] == null
//             ? null
//             : List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "text": text,
//         "tags": tags == null
//             ? null
//             : List<dynamic>.from(tags!.map((x) => x.toJson())),
//       };
// }

// class Tag {
//   Tag({
//     required this.id,
//     required this.tagText,
//     required this.displayText,
//     required this.url,
//     required this.type,
//   });

//   final String id;
//   final String tagText;
//   final String displayText;
//   final String url;
//   final String type;

//   factory Tag.fromJson(Map<String, dynamic> json) => Tag(
//         id: json["id"],
//         tagText: json["tag_text"],
//         displayText: json["display_text"],
//         url: json["url"],
//         type: json["type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "tag_text": tagText,
//         "display_text": displayText,
//         "url": url,
//         "type": type,
//       };
// }

// class Media {
//   Media({
//     required this.url,
//     required this.blurHash,
//     required this.type,
//   });

//   final String url;
//   final String blurHash;
//   final TypeEnum? type;

//   factory Media.fromJson(Map<String, dynamic> json) => Media(
//         url: json["url"],
//         blurHash: json["blur_hash"] == null ? null : json["blur_hash"],
//         type: typeEnumValues.map[json["type"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "blur_hash": blurHash == null ? null : blurHash,
//         "type": typeEnumValues.reverse[type],
//       };
// }

// enum TypeEnum { IMAGE }

// final typeEnumValues = EnumValues({"image": TypeEnum.IMAGE});

// class Spot {
//   Spot({
//     required this.id,
//     required this.name,
//     required this.types,
//     required this.logo,
//     required this.location,
//     required this.isSaved,
//   });

//   final String id;
//   final String name;
//   final List<TypeElement> types;
//   final Media logo;
//   final Location location;
//   final bool isSaved;

//   factory Spot.fromJson(Map<String, dynamic> json) => Spot(
//         id: json["id"],
//         name: json["name"],
//         types: List<TypeElement>.from(
//             json["types"].map((x) => TypeElement.fromJson(x))),
//         logo: Media.fromJson(json["logo"]),
//         location: Location.fromJson(json["location"]),
//         isSaved: json["is_saved"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "types": List<dynamic>.from(types.map((x) => x.toJson())),
//         "logo": logo.toJson(),
//         "location": location.toJson(),
//         "is_saved": isSaved,
//       };
// }

// class Location {
//   Location({
//     required this.latitude,
//     required this.longitude,
//     required this.display,
//   });

//   final double latitude;
//   final double longitude;
//   final String display;

//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//         display: json["display"],
//       );

//   Map<String, dynamic> toJson() => {
//         "latitude": latitude,
//         "longitude": longitude,
//         "display": display,
//       };
// }

// class TypeElement {
//   TypeElement({
//     required this.id,
//     required this.name,
//     required this.url,
//   });

//   final int id;
//   final String name;
//   final String url;

//   factory TypeElement.fromJson(Map<String, dynamic> json) => TypeElement(
//         id: json["id"],
//         name: json["name"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "url": url,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap = {};

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final usersDataModel = usersDataModelFromMap(jsonString);
