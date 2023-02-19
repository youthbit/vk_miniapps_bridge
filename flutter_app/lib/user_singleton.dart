class UserSingleton {

  static final UserSingleton _instance = UserSingleton._();

  factory UserSingleton() {
    return _instance;
  }


  bool isInit = false;
  String? name, photoUrl;

  UserSingleton._();
}