import 'package:deeplinks_app/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _handleLogin(BuildContext context) async {
    bool loginSuccess = true;
    final instance = await SharedPreferences.getInstance();
    await instance.setBool('hasLogged', loginSuccess);

    if (loginSuccess) {
      final deeplink = RouterImpl.pendingDeeplink.value;
      if (deeplink != null) {
        RouterImpl.pendingDeeplink.value = null;
        RouterImpl.router.go(deeplink);
      } else {
        RouterImpl.router.go('/products');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _handleLogin(context),
          child: const Text("Login"),
        ),
      ),
    );
  }
}
