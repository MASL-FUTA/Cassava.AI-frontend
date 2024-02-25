class AuthResponse {
  bool success = false;
  String message = '';

  AuthResponse({
    this.success = false,
    this.message = '',
  });

  AuthResponse.getData(Map<String, dynamic> map) {
    success = map["success"]??false;
    message = map["message"]??'';
  }

  Map<String, dynamic> getMap() {
    return {
      'success':success,
      'message':message,
    };
  }
}