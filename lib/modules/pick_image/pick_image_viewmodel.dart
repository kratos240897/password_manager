import 'package:flutter/material.dart';
import 'package:password_manager/core/constants/app/constants.dart';
import 'package:unsplash_client/unsplash_client.dart';

class PickImageVieMmodel with ChangeNotifier {
  final List<String> images = [];
  final _client = UnsplashClient(
    settings: const ClientSettings(
        credentials: AppCredentials(
            accessKey: Constants.UNSPLASH_ACCESS_KEY,
            secretKey: Constants.UNSPLASH_SECRET_KEY)),
  );

  getImages(String query) async {
    final req = await _client.search.photos('$query logo').goAndGet();
    for (Photo i in req.results) {
      images.add(i.urls.full.toString());
    }
    notifyListeners();
  }

  pickImage(BuildContext context, int index) {
    final result = images[index];
    Navigator.of(context).pop(result);
  }
}
