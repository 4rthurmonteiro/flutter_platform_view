import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:native_view_platform_interface/native_view_platform_interface.dart';

class NativeViewIos extends NativeViewPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('native_view_ios');

  static void registerWith() {
    NativeViewPlatform.instance = NativeViewIos();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }

  @override
  Widget getPlatformByeView() {
    return const _UiKitBox(viewType: '@views/native-view-bye');
  }

  @override
  Widget getPlatformHelloView() {
    return const _UiKitBox(viewType: '@views/native-view-hello');
  }
}

class _UiKitBox extends StatelessWidget {
  const _UiKitBox({
    required this.viewType,
  });
  final String viewType;

  @override
  Widget build(BuildContext context) {
    // const viewType = '@views/native-view';

    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: const <String, dynamic>{},
      gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{
        Factory<OneSequenceGestureRecognizer>(
          EagerGestureRecognizer.new,
        ),
      },
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
