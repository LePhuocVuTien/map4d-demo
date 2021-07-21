//
//  AppDelegate.swift
//  demo
//
//  Created by Tien Le Phuoc Vu on 21/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    if let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
      window?.rootViewController = controller
      window?.makeKeyAndVisible()
    }
    return true
  }
  
  
  
}

