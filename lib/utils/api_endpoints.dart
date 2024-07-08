class ApiEndpoints {
  static const String localUrl = 'http://192.168.1.40:8080/';
  static const String baseUrl = 'https://foodorder-4s4l.onrender.com/';
  static _AuthEndpoints authEndpoints = _AuthEndpoints();
}

 class _AuthEndpoints {
  final String registerCustomer = 'customer/signup';
  final String loginCustomer = 'customer/login';
  final String sendCode = 'customer/sendCode';
  final String verifyCode = 'customer/verifyCode';

}

class RestaurnatEndpoints {
  final getRestaurnat = "restaurant";
}