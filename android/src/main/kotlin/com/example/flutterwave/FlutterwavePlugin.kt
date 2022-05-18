package com.example.flutterwave

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*

/** FlutterwavePlugin */
class FlutterwavePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context : Context


  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding,) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutterwave")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if(call.method == "flutterwave2"){
      val arguments: ArrayList<String> = call.arguments as ArrayList<String>
      testingClient(context,arguments.get(0) as String)
    }else{
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

   fun testingClient(ctx: Context, amount: String)
  {
    val intent: Intent? = ctx.getPackageManager().getLaunchIntentForPackage("com.flutterwave.baseapp")
    if (intent != null) {
      print("amount: $amount")
      // We found the activity now start the activity
      var bundle: Bundle = Bundle()
      bundle.putString("Amount", amount)
      bundle.putBoolean("keydownload", true)

      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      ctx.startActivity(intent, bundle)
    }
  }
}
