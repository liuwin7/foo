import Foundation
import UIKit

@objc public class ScreenOrientation: NSObject {
    
    public func getCurrentOrientationType() -> String {
        let currentOrientation: UIDeviceOrientation = UIDevice.current.orientation
        return fromDeviceOrientationToOrientationType(currentOrientation)
    }
    
    public func lock(_ orientationType: String, complation: @escaping (UIInterfaceOrientationMask) -> Void) {
        DispatchQueue.main.async {
            let mask = self.fromOrientationTypeToMask(orientationType)
            let orientation = self.fromOrientationTypeToInt(orientationType)
            UIDevice.current.setValue(orientation, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
            complation(mask)
        }
    }
    
    public func unlock(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            let unknownOriention = UIDeviceOrientation.unknown.rawValue
            UIDevice.current.setValue(unknownOriention, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
            completion()
        }
    }
    
    private func fromOrientationTypeToMask(_ orientationType: String) -> UIInterfaceOrientationMask {
        switch orientationType {
        case "landscape-primary":
            return UIInterfaceOrientationMask.landscapeLeft
          case "landscape-secondary":
            return UIInterfaceOrientationMask.landscapeRight
          case "portrait-secondary":
            return UIInterfaceOrientationMask.portraitUpsideDown
          default:
            // Case: portrait-primary
            return UIInterfaceOrientationMask.portrait
        }
    }
    
    private func fromOrientationTypeToInt(_ orientationType: String) -> Int {
        return Int(self.fromOrientationTypeToMask(orientationType).rawValue)
    }
    
    private func fromDeviceOrientationToOrientationType(_ orientation: UIDeviceOrientation) -> String {
        switch orientation {
        case .portraitUpsideDown:
            return "portrait-secondary"
        case .landscapeLeft:
            return "landscape-primary"
        case .landscapeRight:
            return "landscape-secondary"
        default:
            return "portrait-primary"
        }
    }
}
