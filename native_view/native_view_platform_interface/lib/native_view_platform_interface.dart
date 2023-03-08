import 'package:flutter/widgets.dart';
import 'package:native_view_platform_interface/src/method_channel_native_view.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class NativeViewPlatform extends PlatformInterface {
  NativeViewPlatform() : super(token: _token);

  static final Object _token = Object();
  static NativeViewPlatform _instance = MethodChannelNativeView();

  static NativeViewPlatform get instance => _instance;

  static set instance(NativeViewPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();

  /// Returns the platform specific widget
  Widget getPlatformHelloView();
  Widget getPlatformByeView();
}
