//
//  AppDelegate.swift
//  Demo
//
//  Created by 马权 on 5/17/16.
//  Copyright © 2016 马权. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let printTime: (() -> Void) -> Void = {
            let startTime: CFTimeInterval = CACurrentMediaTime()
            $0()
            let endTime: CFTimeInterval = CACurrentMediaTime()
            print((endTime - startTime) * 1000)
        }
        
        let time: UInt = 5
        
//          Track
        let cache: Cache = Cache.shareInstance
        
        for i in 1 ... 5 {
            cache.set(object: "\(i)" as NSCoding, forKey: "\(i)")
        }
        
        for i in 6 ... 7 {
            cache.set(object: "\(i)" as NSCoding, forKey: "\(i)")
        }
        
        for object in cache {
            print(object)
        }
        
        cache.forEach {
            print($0)
        }

        let values = cache.map { return $0 }

        print(values)

        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

