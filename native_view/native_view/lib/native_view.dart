import 'package:flutter/material.dart';
import 'package:native_view_platform_interface/native_view_platform_interface.dart';

NativeViewPlatform get _platform => NativeViewPlatform.instance;

Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}

class HelloView extends StatelessWidget {
  const HelloView({super.key});

  @override
  Widget build(BuildContext context) {
    return _platform.getPlatformHelloView();
  }
}

class ByeView extends StatelessWidget {
  const ByeView({super.key});

  @override
  Widget build(BuildContext context) {
    return _platform.getPlatformByeView();
  }
}
