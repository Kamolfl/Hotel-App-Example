import 'package:dio/dio.dart';

class HotelApi {
  Dio dio = Dio();

  Future<dynamic> fetchHomePageData() async {
    try{
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
  
  Future<dynamic> fetchHotelPageData() async {
    try {
      Response response = await dio.get('https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Не удалось загрузить данные об номере отела');
      }
    } catch (e) {
      throw Exception('Не удалось загрузить данные об номере отела: $e');
    }
  }

  Future<dynamic> fetchBookingPageData() async {
    try {
      Response response = await dio.get('https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Не удалось загрузить данные об бронирование номере отела');
      }
    } catch(e) {
      throw Exception('Не удалось загрузить данные об бронирование номере отела: $e');
    }
  }
}