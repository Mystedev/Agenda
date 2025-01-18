import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AlsaRoute extends StatefulWidget {
  const AlsaRoute({super.key});

  @override
  State<AlsaRoute> createState() => _AlsaRouteState();
}

class _AlsaRouteState extends State<AlsaRoute> {
  late final WebViewController _webViewController;
  String title = 'Alsa';

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.alsa.es/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
