import 'dart:convert';

import 'package:http/http.dart';
import 'package:texttoimage/repositary/api/api_client.dart';

import '../model/model.dart';

class ImagineApi {
  ApiClient apiClient = ApiClient();

  Future<Model> getTranslate(String text) async {
    String trendingpath = 'https://animimagine-ai.p.rapidapi.com/generateImage';
    var body = {
      "selected_model_id": "anything-v5",
      "selected_model_bsize": "512",
      "prompt": text,
    };
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return Model.fromJson(jsonDecode(response.body));
  }
}
