import 'package:flutter_app_sale_29092023/data/api/api_service.dart';
import 'package:flutter_app_sale_29092023/data/api/dto/app_response_dto.dart';
import 'package:flutter_app_sale_29092023/data/api/dto/user_dto.dart';

class AuthenticationRepository {
  ApiService? _apiService;

  void setApiService(ApiService apiService) {
    _apiService = apiService;
  }

  Future<UserDTO> executeGetWeatherFromCity(String cityName) {
    Completer<SearchWeatherFromCityDTO> completer = Completer();
    _apiService
        ?.requestWeatherFromCity(cityName)
        .then((dataResponse) {
      if (dataResponse.data == null || dataResponse.data == "") {
        completer.complete(SearchWeatherFromCityDTO());
      } else {
        completer.complete(SearchWeatherFromCityDTO.fromJson(dataResponse.data));
      }
    })
        .catchError((error) {
      completer.completeError(error.response?.data["message"] ?? error.toString());
    });

    return completer.future;
  }
}