import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class web extends StatelessWidget {
  const web({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new WebView(
        initialUrl: "http://swamedika.com/landing",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
