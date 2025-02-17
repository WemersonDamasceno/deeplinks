import '../core/deep_link_handler.dart';

class DeepLinkController {
  final DeepLinkHandler deepLinkHandler;

  DeepLinkController(this.deepLinkHandler);

  void initialize(Function(Uri) onDeepLinkReceived) {
    deepLinkHandler.handleInitialLink(onDeepLinkReceived);
    deepLinkHandler.listenToLinks(onDeepLinkReceived);
  }
}
