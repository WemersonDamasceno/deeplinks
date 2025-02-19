import 'package:deeplinks_app/presentation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final instance = await SharedPreferences.getInstance();
              await instance.setBool('hasLogged', false);
              RouterImpl.router.pop();
              RouterImpl.router.pushReplacement('/login');
            },
          )
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Perfil"),
          ],
        ),
      ),
    );
  }
}
