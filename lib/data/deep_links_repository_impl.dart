import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';

abstract class DeepLinkRepository {
  Future<Uri?> getInitialLink();
  Stream<Uri?> getLinkStream();
}

class DeepLinkRepositoryImpl implements DeepLinkRepository {
  final _appLinks = AppLinks();

  @override
  Future<Uri?> getInitialLink() async {
    try {
      return await getInitialLink();
    } catch (e) {
      if (kDebugMode) {
        print('Erro ao pegar deep link inicial: $e');
      }
      return null;
    }
  }

  @override
  Stream<Uri?> getLinkStream() {
    return _appLinks.uriLinkStream;
  }
}
