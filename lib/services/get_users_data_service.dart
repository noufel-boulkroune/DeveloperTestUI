import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/users_data_model.dart';

class GetDataServices {
  Future<List<UsersDataModel>> getAllData() async {
    final url = Uri.parse("https://dev.api.spotlas.com/interview/feed?page=1");
    var response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> usersData = jsonDecode(response.body);
        return usersData
            .map((listItems) => UsersDataModel.fromMap(listItems))
            .toList();
      } else {
        return [];
      }
    } catch (error) {
      throw (error);
    }
  }
}


//import 'package:dio/dio.dart';

// class GetDataServices {
//   List<UsersDataModel> _usersList = [];
//   Future<void> getAllData() async {
//     final url = Uri.parse("https://dev.api.spotlas.com/interview/feed?page=1");
//     var response = await http.get(url);

//     try {
//       if (response.statusCode == 200) {
//         final List<dynamic> usersData = json.decode(response.body);
//         usersData
//             .map((listItems) => _usersList.add(UsersDataModel(
//                   id: listItems["id"],
//                   caption: Caption.fromJson(listItems["caption"]),
//                   media: List<Media>.from(
//                       listItems["media"].map((x) => Media.fromJson(x))),
//                   createdAt: DateTime.parse(listItems["created_at"]),
//                   author: Author.fromJson(listItems["author"]),
//                   spot: Spot.fromJson(listItems["spot"]),
//                   relevantComments: listItems["relevant_comments"],
//                   numberOfComments: listItems["number_of_comments"],
//                   likedBy: listItems["liked_by"] == null
//                       ? null
//                       : List<Author>.from(
//                           listItems["liked_by"].map((x) => Author.fromJson(x))),
//                   numberOfLikes: listItems["number_of_likes"],
//                   tags: listItems["tags"],
//                   url: listItems["url"],
//                 )))
//             .toList();
//         print(_usersList);
//       } else {}
//     } catch (error) {
//       throw (error);
//     }
//   }
// }