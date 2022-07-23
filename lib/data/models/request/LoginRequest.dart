

class LoginRequest {
  late String email;
  late String password;
    String reg = "";

  LoginRequest.emailpass(this.email, this.password);

  LoginRequest();

  static LoginRequest? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    LoginRequest loginRequestBean = LoginRequest();
    loginRequestBean.email = map['email'];
    loginRequestBean.password = map['password'];
    return loginRequestBean;
  }

  Map toJson() => {
    "email": email,
    "password": password,
    "reg": reg,
  };
}