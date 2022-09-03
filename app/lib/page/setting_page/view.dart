import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends ConsumerWidget {
  SettingPage({Key? key}) : super(key: key);

  final Uri _url = Uri.parse(
      'https://matatabinoneko.github.io/flutter-multi-calculator/privacy-policy');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("Setting Page")),
        body: Container(
          alignment: AlignmentDirectional.topCenter,
          child: Column(children: [
            InkWell(
              onTap: () => {_launchUrl()},
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                ),
                child: Text(
                  '規約とプライバシーポリシー',
                ),
              ),
            )
          ]),
        ));
  }
}
