import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeImagesLocally(List<String> imageUrls) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('imageUrls', imageUrls);
}




