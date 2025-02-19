import 'package:deeplinks_app/domain/usecase/verify_user_is_logged_usecase.dart';
import 'package:deeplinks_app/presentation/home/models/item_shop.dart';
import 'package:deeplinks_app/presentation/home/pages/home/home_shop_page.dart';
import 'package:deeplinks_app/presentation/login/views/login_page.dart';
import 'package:deeplinks_app/presentation/perfil/views/perfil_page.dart';
import 'package:deeplinks_app/presentation/product_details/product_details_page.dart';
import 'package:deeplinks_app/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterImpl {
  static final ValueNotifier<String?> pendingDeeplink = ValueNotifier(null);

  static final verifyUserIsLoggedUsecase = VerifyUserIsLoggedUsecase();
  static final freeRoutes = ['/login', '/products', '/products/productId', '/'];

  static void redirectUser(String deeplink) {
    final route = deeplink.replaceAll(
      'https://novasystem.deeplinks_app.com',
      '',
    );
    router.go(route);
  }

  static final router = GoRouter(
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      if (!freeRoutes.contains(state.fullPath)) {
        final isLogged = await verifyUserIsLoggedUsecase.userIsLogged();
        if (!isLogged) {
          pendingDeeplink.value = state.fullPath;
          return '/login';
        }
      }
      return state.fullPath;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => const HomeShopPage(),
        routes: [
          GoRoute(
            path: '/productId',
            builder: (context, state) {
              final productId = state.uri.queryParameters['productId'];
              final product = state.extra as ItemProduct?;
              return ProductDetails(
                productId: productId ?? '',
                product: product,
              );
            },
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const PerfilPage(),
          ),
        ],
      ),
    ],
  );
}
