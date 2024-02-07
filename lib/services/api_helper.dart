import 'dart:convert';

import 'package:algoocean_app/model/img_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<ImageModel?> getImg() async{
    try {
      String ImageUrl="https://dog.ceo/api/breeds/image/random";
      final url = Uri.parse(ImageUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
            ImageModel model=ImageModel.fromJson(jsonDecode(response.body));
            return model;
      }
    }catch (e) {
        print(e.toString());
    }
    return null;


  }

}
