import 'package:flutter/material.dart';
import 'package:tamim/main.dart';

const defaultGroupImage = 'groups';

class StorageService {
  static String getPublicUrl(
      {String bucket = defaultGroupImage, required String path}) {
    return supabase.storage.from(bucket).getPublicUrl(path);
  }

  static Widget getGroupImage(String path) {
    return Image.network(
      getPublicUrl(path: path),
      errorBuilder: (context, error, stackTrace) =>
          Image.asset('assets/images/parish_group_default.png'),
    );
  }

  static Widget getProfileImage(String path) {
    return Image.network(
      getPublicUrl(path: path),
      errorBuilder: (context, error, stackTrace) =>
          Image.asset('assets/images/profile_default.png'),
    );
  }
}
