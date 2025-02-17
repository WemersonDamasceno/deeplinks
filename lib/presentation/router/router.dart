import 'package:deeplinks_app/presentation/home/models/item_shop.dart';
import 'package:deeplinks_app/presentation/home/pages/home/home_shop_page.dart';
import 'package:deeplinks_app/presentation/product_details/product_details_page.dart';
import 'package:deeplinks_app/presentation/splash/splash_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
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
      ],
    ),
  ],
);
