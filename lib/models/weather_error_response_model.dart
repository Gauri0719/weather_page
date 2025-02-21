class WeatherErrorResponseModel {
  final Error? error;

  WeatherErrorResponseModel({
    this.error,
  });

}

class Error {
  final int? code;
  final String? message;

  Error({
    this.code,
    this.message,
  });

}
