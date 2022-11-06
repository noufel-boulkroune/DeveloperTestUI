import 'dart:async';

import 'package:flutter/widgets.dart';

import '../models/users_data_model.dart';
import '../services/get_users_data_service.dart';

class ListUsersProvider with ChangeNotifier {
  bool isLoading = false;
  bool _isliked = false;
  bool _shouldShow = false;
  int _captionLineNumbre = 1;

  //
  List<UsersDataModel> _usersList = [];
  List<UsersDataModel> get usersList {
    return _usersList;
  }

  bool get isLiked {
    return _isliked;
  }

  bool get shouldShow {
    return _shouldShow;
  }

  int get captionLineNumbre {
    return _captionLineNumbre;
  }

  void changeCaptionMaxLine() {
    _captionLineNumbre == 3 ? _captionLineNumbre = 1 : _captionLineNumbre = 3;
    notifyListeners();
  }

  void likeImage() {
    _isliked = !_isliked;
    notifyListeners();
  }

  void shouldShowHeart() {
    _shouldShow = true;
    notifyListeners();
    Timer(const Duration(seconds: 1), () {
      _shouldShow = false;
      notifyListeners();
    });
  }

  void isSpotFavorite(userId) {
    _usersList.forEach((userListData) {
      if (userListData.id == userId) {
        userListData.spot.isSaved = !userListData.spot.isSaved;
        notifyListeners();
      }
    });

    // _usersList[index].spot.isSaved = !_usersList[index].spot.isSaved;

    //_isFavorite = _usersList[index].spot.isSaved;
  }

  final _getDataServices = GetDataServices();
  Future<void> getAllUserData() async {
    isLoading = true;

    _usersList = await _getDataServices.getAllData();

    isLoading = false;
    notifyListeners();
  }
}
