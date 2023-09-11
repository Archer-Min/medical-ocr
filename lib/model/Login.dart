class Login {
  final int code;
  final String msg;


  Login({
    required this.code,
    required this.msg,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      code: json['code'],
      msg: json['msg'],
    );
  }

}