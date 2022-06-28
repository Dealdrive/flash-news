import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends HookWidget {
  static const String routeName = "/web-view-screen";

  final String pageUrl;
  final String title;

  const WebViewScreen({
    Key? key,
    required this.pageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPageLoading = useState(true);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          titleSpacing: 2.0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 2),
              Text(
                pageUrl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: pageUrl,
              //javascriptMode: JavascriptMode.values[0],
              onPageFinished: (value) {
                isPageLoading.value = false;
              },
            ),
            Visibility(
              visible: isPageLoading.value,
              child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ));
  }
}
