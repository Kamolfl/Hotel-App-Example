import 'package:dio/dio.dart';

class HotelApi {
  Future<dynamic> fetchHotelData() async {
    try{
      Dio dio = Dio();
      Response response = await dio.get('https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Не удалось загрузить данные об отеле');
      }
    } catch (e) {
      throw Exception('Не удалось загрузить данные об отеле: $e');
    }
  }
}