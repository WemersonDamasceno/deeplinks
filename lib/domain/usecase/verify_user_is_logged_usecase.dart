import 'package:shared_preferences/shared_preferences.dart';

class VerifyUserIsLoggedUsecase {
  Future<bool> userIsLogged() async {
    final instance = await SharedPreferences.getInstance();
    final hasLogged = instance.getBool('hasLogged');

    return Future.value(hasLogged ?? false);
  }
}
