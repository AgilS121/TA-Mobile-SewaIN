class TokenManager {
  static TokenManager? _instance;
  String? _accessToken;

  TokenManager._internal();

  factory TokenManager() {
    if (_instance == null) {
      _instance = TokenManager._internal();
    }
    return _instance!;
  }

  String? get accessToken => _accessToken;

  set accessToken(String? token) {
    _accessToken = token;
  }
}
