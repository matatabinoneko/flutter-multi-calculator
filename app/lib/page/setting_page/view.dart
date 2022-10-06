import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingPage extends ConsumerWidget {
  SettingPage({Key? key}) : super(key: key);

  final Uri _url = Uri.parse(
      'https://matatabinoneko.github.io/flutter-multi-calculator/privacy-policy');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<PackageInfo>(
        future: _getPackageInfo(),
        builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final packageInfo = snapshot.data!;
          return Scaffold(
              appBar: AppBar(title: Text(packageInfo.appName)),
              body: ListView(children: <Widget>[
                ListTile(
                    onTap: _launchUrl,
                    leading: const Icon(Icons.person),
                    title: const Text('規約とプライバシーポリシー')),
                ListTile(
                    title: Text(
                  'version: ${packageInfo.version}',
                  textAlign: TextAlign.center,
                )),
              ]));
        });
  }
}
