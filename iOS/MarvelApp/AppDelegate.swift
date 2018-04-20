//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        AppConfig.enforceAPIKeysAreSetUp()
        applyCustomNavBarStyle()
        return true
    }
    
    private func applyCustomNavBarStyle() {
        let navigationTitleFont = FontUtils.getMarvelFont(withSize: 21)
        let barButtonTitleFont = FontUtils.getMarvelFont(withSize: 18)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: navigationTitleFont, NSAttributedStringKey.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: barButtonTitleFont, NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: barButtonTitleFont, NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.focused)
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: barButtonTitleFont, NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.highlighted)
    }

}
