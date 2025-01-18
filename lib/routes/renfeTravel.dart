// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RenfeRoute extends StatefulWidget {
  const RenfeRoute({super.key});

  @override
  State<RenfeRoute> createState() => _RenfeRouteState();
}

class _RenfeRouteState extends State<RenfeRoute> {
late final WebViewController _webViewController;
String title = 'Renfe';

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
    ..loadRequest(Uri.parse('https://rodalies.gencat.cat/es/horaris/index.html'));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
