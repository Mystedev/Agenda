
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class TMBRoute extends StatefulWidget {
  const TMBRoute({super.key});

  @override
  State<TMBRoute> createState() => _TMBRouteState();
}

class _TMBRouteState extends State<TMBRoute> {
  late final WebViewController _webViewController;
  String title = 'TMB';

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
      ..loadRequest(Uri.parse('https://www.tmb.cat/es/transporte-barcelona'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebViewWidget(controller: _webViewController),
    );
  }
}
