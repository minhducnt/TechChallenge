import 'package:hive/hive.dart';

import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/data/models/responses/user/sof.user.model.dart';

/// SofUser Source
class SofUserSource {
  final _sofUserBox = Hive.box($r.box.sofUserBox);

  static const defaultSofUser = SofUserModel();

  Future<List<SofUserModel>> getBookmarks() async {
    final List<SofUserModel> bookmarks = [];
    for (var key in _sofUserBox.keys) {
      bookmarks.add(_sofUserBox.get(key));
    }
    return bookmarks;
  }

  bool isFavorite(int userId) {
    return _sofUserBox.containsKey(userId);
  }

  Future<void> toggleFavorite(SofUserModel userData) async {
    if (isFavorite(userData.accountId ?? 0)) {
      await _sofUserBox.delete(userData.accountId);
    } else {
      await _sofUserBox.put(userData.accountId, userData);
    }
  }

  Future<void> clearSofUserData() async {
    await $storage.clearAll();
    await _sofUserBox.add(defaultSofUser);
  }
}
