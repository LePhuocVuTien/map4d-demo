//
//  AppDelegate.swift
//  Map4D
//
//  Created by Tien Le Phuoc Vu on 21/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow()
    Application.shared.window = window!
    Application.shared.start()
    
    return true
  }


}

