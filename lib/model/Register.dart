class Register {
  final String code;
  final String msg;


  Register({
    required this.code,
    required this.msg,
  });

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      code: json['code'],
      msg: json['msg'],
    );
  }

}