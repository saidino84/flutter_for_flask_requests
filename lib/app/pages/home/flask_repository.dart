import 'dart:convert';

import 'package:flask_reqsts/app/models/image_model.dart';
import 'package:flask_reqsts/shared.dart';
import 'package:http/http.dart';

class FlaskRepository {
  var baseUrl = 'http://127.0.0.1:5000/imageapi/';

  // @override
  // Future<Response<T>> get<T>(String url, {Map<String, String>? headers, String? contentType, Map<String, dynamic>? query, Decoder<T>? decoder}) {
  //   // TODO: implement get
  //   return super.get(url, headers, contentType, query, decoder);
  // }

  Future<List<ImageModel>> getAllVideos() async {
    try {
      print('INiciando requisicao');
      final response = await get(Uri.parse('${baseUrl}2'));
      final List<dynamic> responseMap = jsonDecode(response.body);
      print(responseMap);
      return responseMap
          .map<ImageModel>((map) => ImageModel.fromMap(map))
          .toList();
    } catch (err) {
      print("Ocorreu um eroo $err");
      throw err;
    }
  }

  Future<ImageModel> makeLike(ImageModel image) async {
    try {
      final response = await patch(Uri.parse('$baseUrl${image.id}'),
          body: {"likes": "${image.likes}"});
      final jsonResponse = jsonDecode(response.body);

      print('ACTUALIZACOA FEITA COM SUCESSO response BODY: jsonResponse');

      ImageModel newImage = ImageModel.fromMap(jsonResponse);
      print("       ===================${newImage.imageUrl}");
      return newImage;
    } catch (err) {
      print('Erro ao fazer actualizacoa');
      throw err;
    }
  }
}
