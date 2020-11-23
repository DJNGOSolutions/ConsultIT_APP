class NetworkUtils {
  static final String path = "http://consultit.nelsoncaastro.me/api/";
}

class ServerResponse {
  String message;
  int statusCode;

  ServerResponse({this.message, this.statusCode});

  factory ServerResponse.fromJson(Map<String, dynamic> json) {
    return ServerResponse(message: json['message']);
  }
}
