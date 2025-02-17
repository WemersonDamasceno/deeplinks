import 'package:deeplinks_app/data/deep_links_repository_impl.dart';

class DeepLinkHandler {
  final DeepLinkRepository repository;

  DeepLinkHandler(this.repository);

  Future<void> handleInitialLink(Function(Uri) onLinkReceived) async {
    final link = await repository.getInitialLink();
    if (link != null) {
      onLinkReceived(link);
    }
  }

  void listenToLinks(Function(Uri) onLinkReceived) {
    repository.getLinkStream().listen((link) {
      if (link != null) {
        onLinkReceived(link);
      }
    });
  }
}
