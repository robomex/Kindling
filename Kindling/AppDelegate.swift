//
//  AppDelegate.swift
//  Kindling
//
//  Created by Tony Morales on 4/15/15.
//  Copyright (c) 2015 Tony Morales. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.setApplicationId("FDUX7G8hn6A84zVvWZuDSXudWToTdQjg9bLR1TK5", clientKey: "Y6c3ax2RKRLcPQ55SMzrTRlBsSc5WHjBZjGqlICJ")
        
        PFFacebookUtils.initializeFacebook()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var initialViewController: UIViewController
        
        if currentUser() != nil {
            
            initialViewController = ViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
            
//            below is replaced with line immediately above for initializing view controller via code vs from storyboard
//            initialViewController = storyboard.instantiateViewControllerWithIdentifier("PageController") as! UIViewController
        } else {
            initialViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! UIViewController
        }
        
        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBAppCall.handleOpenURL(url, sourceApplication: sourceApplication, withSession: PFFacebookUtils.session())
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        FBAppCall.handleDidBecomeActiveWithSession(PFFacebookUtils.session())
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        PFFacebookUtils.session()?.close()
    }


}

