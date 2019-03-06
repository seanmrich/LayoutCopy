import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var slideViewController: SlideViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        slideViewController.updateContainerView()
    }
}

