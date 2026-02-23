import UIKit
import Flutter
import GoogleMaps   // 👈 مهم

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    // 🔑 Google Maps API Key
    GMSServices.provideAPIKey("AIzaSyCt4XecKCIy4Q5lo0OmyEyVZSheCuTVLIo")

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
