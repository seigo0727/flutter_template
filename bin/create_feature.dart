import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('使い方: flutter pub run bin/create_feature.dart <feature名>');
    exit(1);
  }

  final featureName = args[0];
  final baseDir = 'lib/features/$featureName/presentation';

  // ディレクトリ構成を作成
  final dirs = [
    '$baseDir/pages',
    '$baseDir/providers',
    '$baseDir/widgets',
  ];

  for (var dir in dirs) {
    Directory(dir).createSync(recursive: true);
  }

  // ページファイル
  final pageFile = File('$baseDir/pages/${featureName}_page.dart');
  pageFile.writeAsStringSync('''
import 'package:flutter/material.dart';

class ${_pascalCase(featureName)}Page extends StatelessWidget {
  const ${_pascalCase(featureName)}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('${_pascalCase(featureName)} Page'),
      ),
      body: const Center(
        child: Text('This is the ${_pascalCase(featureName)} page.'),
      ),
    );
  }
}
''');

  // プロバイダーファイル
  final providerFile = File('$baseDir/providers/${featureName}_provider.dart');
  providerFile.writeAsStringSync('''
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ${featureName}Provider = StateProvider<int>((ref) => 0);
''');

  // ウィジェットファイル
  final widgetFile = File('$baseDir/widgets/${featureName}_widget.dart');
  widgetFile.writeAsStringSync('''
import 'package:flutter/material.dart';

class ${_pascalCase(featureName)}Widget extends StatelessWidget {
  const ${_pascalCase(featureName)}Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('This is ${_pascalCase(featureName)} widget.');
  }
}
''');

  print('✅ Feature "$featureName" の雛形を作成しました！');
}

String _pascalCase(String text) {
  return text.split('_').map((w) => w[0].toUpperCase() + w.substring(1)).join();
}
