package com.example.native_view_android

import android.content.Context
import android.view.View
import android.widget.TextView
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/** NativeViewAndroidPlugin */
class NativeViewAndroidPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "native_view_android")
    channel.setMethodCallHandler(this)

    flutterPluginBinding
       .platformViewRegistry
       .registerViewFactory("@views/native-view-hello", NativeHelloViewFactory())

      flutterPluginBinding
          .platformViewRegistry
          .registerViewFactory("@views/native-view-bye", NativeByeViewFactory())
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformName") {
        result.success("Android")
    } else {
        result.notImplemented()
    }
  }
}


class NativeHelloViewFactory() :
   PlatformViewFactory(StandardMessageCodec.INSTANCE) {
   override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
       val creationParams = args as Map<String?, Any?>?
       return NativeHelloView(context, viewId, creationParams)
   }
}

internal class NativeHelloView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
   private val textView: TextView

   override fun getView(): View {
       return textView
   }
    override fun dispose() {}

   init {
       textView = TextView(context)
       textView.textSize = 72f
       textView.text = "Hello from Android"
   }
}

class NativeByeViewFactory() :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return NativeByeView(context, viewId, creationParams)
    }
}

internal class NativeByeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }
    override fun dispose() {}

    init {
        textView = TextView(context)
        textView.textSize = 72f
        textView.text = "Bye from Android"
    }
}