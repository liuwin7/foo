import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(ScreenOrientationPlugin)
public class ScreenOrientationPlugin: CAPPlugin {
    private let implementation = ScreenOrientation()

    public static var supportedOrientations = UIInterfaceOrientationMask.all
    
    public override func load() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(orientationDidChange),
            name: UIDevice.orientationDidChangeNotification,
            object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func orientationDidChange() {
        if UIDevice.current.orientation.isValidInterfaceOrientation {
            let orientation = implementation.getCurrentOrientationType()
            notifyListeners("screenOrientationChange", data: ["type": orientation])
        }
    }
    
    @objc public func orientation(_ call: CAPPluginCall) {
        let orientationType = implementation.getCurrentOrientationType()
        call.resolve(["type": orientationType])
    }
    
    @objc public func lock(_ call: CAPPluginCall) {
        guard let lockToOrientation = call.getString("orientation") else {
            call.reject("Input option 'orientation' must be provided")
            return
        }
        implementation.lock(lockToOrientation) { mask in
            ScreenOrientationPlugin.supportedOrientations = mask
            call.resolve()
        }
    }
    
    @objc public func unlock(_ call: CAPPluginCall) {
        implementation.unlock {
            ScreenOrientationPlugin.supportedOrientations = UIInterfaceOrientationMask.all
            call.resolve()
        }
    }
}
