//
//  AppDelegate.swift
//  Promise
//
//  Created by Prime Inspection
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import SCLAlertView
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var appDelegate : AppDelegate?
    static var window1 : UIWindow?
    var orientationLock = UIInterfaceOrientationMask.portrait
    var myOrientation: UIInterfaceOrientationMask = .landscape

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.appDelegate = self
        AppDelegate.window1 = self.window
        IQKeyboardManager.shared.enable = true
       // if #available(iOS 13.0, *) {
          //  window = UIWindow(frame: UIScreen.main.bounds)
      //  }


        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    // MARK:- Check Reachability
    static func NetworkRechability() -> Bool {
        let reachability = Reachability()!
        if reachability.isReachable {
            if reachability.isReachableViaWiFi || reachability.isReachableViaWWAN {
                return true
            } else {
                return false
            }
        }
        else {
            return false
        }
    }
}

