import UIKit
import CoreData
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        Fabric.with([Crashlytics()])
        
        UITabBar.appearance().backgroundColor = UIColor(red:0, green:0.59, blue:0.53, alpha:1)
        UITabBar.appearance().tintColor = UIColor(red:0, green:0.59, blue:0.53, alpha:1)
        
        loadCustomStoryboardForIPhone4S()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {
        print("applicationDidEnterBackground, idleTimerDisabled = false")
        UIApplication.sharedApplication().idleTimerDisabled = false
    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {
        print("applicationDidBecomeActive, idleTimerDisabled = true")
        UIApplication.sharedApplication().idleTimerDisabled = true
    }

    func applicationWillTerminate(application: UIApplication) {

    }
    
    // iPhone 4S
    func loadCustomStoryboardForIPhone4S() {
        let iOSDeviceScreenSize: CGSize = UIScreen.mainScreen().bounds.size
        if(iOSDeviceScreenSize.height == 480) {
            let storyboard: UIStoryboard = UIStoryboard(name: "iPhone4S", bundle: nil)
            let initial: UIViewController = storyboard.instantiateInitialViewController() as UIViewController!
            
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
            self.window?.rootViewController = initial
            self.window?.makeKeyAndVisible()
        }
    }
}

