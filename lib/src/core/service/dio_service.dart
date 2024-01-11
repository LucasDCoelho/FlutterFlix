import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IHttpClient{
  Future get({ required String url, Map<String, dynamic>? queryParameters});
}


class DioService implements IHttpClient{

  

  @override
  Future get({ required String url, Map<String, dynamic>? queryParameters }) async{
    final client = Dio();
    final apiKey = dotenv.env["TOKEN_AUTH_API"];
    print("$apiKey");

    return client.get(
      url, 
      options: Options(
        method: "GET",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $apiKey",
        }
      ),
      queryParameters: queryParameters
      );
  }
}