import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:native_view_platform_interface/native_view_platform_interface.dart';

class MethodChannelNativeView extends NativeViewPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('native_view');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }

  @override
  Widget getPlatformHelloView() {
    return const SizedBox();
  }

  @override
  Widget getPlatformByeView() {
    return const SizedBox();
  }
}
