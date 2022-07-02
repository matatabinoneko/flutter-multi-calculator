import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';

void main() {
  runApp(
    //Riverpodを使うための設定。ProviderScopeで囲む
    const ProviderScope(child: App()),
  );
}
