import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:solutions_itd_mobile/MainPage/logo.dart';
import 'package:solutions_itd_mobile/utils/app_colors.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            print("error:");
            print(error);
          },
          onNavigationRequest: (NavigationRequest request) {
            print("normal request:");
            print(request);
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://www.example.com/"));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: AppColors.gray,
        title: const Center(
          child: AppLogo(),
        ),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
