import 'package:dio/dio.dart';

Future<String> getHttp(String url) async {
  Response response;
  var dio = Dio();
  response = await dio.get(
    url,
    // options: Options(
    //   headers: headers,
    // )
  );
  return response.toString();
}
