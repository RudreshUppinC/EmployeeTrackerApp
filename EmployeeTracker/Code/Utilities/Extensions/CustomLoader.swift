//
//  CustomLoader.swift
//  EmployeeTraker
//
//  Created by DarkMoon on 16/12/22.
//

import Foundation
import UIKit
import NVActivityIndicatorView

/// Class for configuring loader
class CustomLoader: NSObject {

    private static let tagForWindowLabel: Int = 231233
    private static let tagForWindowLabelBGView: Int = 123312

    static var loadIconDictionary: [UIView: NVActivityIndicatorView] = [:]

    static func loading(_ view: UIView, enable: Bool) {
        view.isUserInteractionEnabled = enable

        if let activityIndicatorView = CustomLoader.loadIconDictionary[view] {
            view.bringSubviewToFront(activityIndicatorView)
            return
        } else {
            let height: CGFloat = 40.0
            let width: CGFloat = 40.0
            let activityIndicatorView = NVActivityIndicatorView(frame: CGRect(x: 50,
                                                                              y: 50,
                                                                              width: width,
                                                                              height: height),
                                                                type: .circleStrokeSpin)
            activityIndicatorView.padding = 5
            activityIndicatorView.color = UIColor.red
            activityIndicatorView.layer.cornerRadius = 5
            activityIndicatorView.layer.borderColor = UIColor.clear.cgColor
            activityIndicatorView.layer.borderWidth = 0
            activityIndicatorView.layer.masksToBounds = true
            activityIndicatorView.backgroundColor = UIColor.clear
            view.addSubview(activityIndicatorView)
            view.bringSubviewToFront(activityIndicatorView)
            activityIndicatorView.startAnimating()
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            activityIndicatorView.alpha = 0

            var constraintArray: [NSLayoutConstraint] = []

            constraintArray.append(view.centerXAnchor.constraint(equalTo: activityIndicatorView.centerXAnchor))
            constraintArray.append(view.centerYAnchor.constraint(equalTo: activityIndicatorView.centerYAnchor))
            constraintArray.append(activityIndicatorView.heightAnchor.constraint(equalToConstant: height))
            constraintArray.append(activityIndicatorView.widthAnchor.constraint(equalToConstant: width))

            NSLayoutConstraint.activate(constraintArray)

            CustomLoader.loadIconDictionary[view] = activityIndicatorView

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {

                UIView.defaultAnimation({
                    activityIndicatorView.alpha = 1.0
                }, duration: 0.25)
            }
        }
    }

    /// Removing the loader from the view
    /// - Parameter view: View from which the loader need to be removed
    static func dismiss(_ view: UIView) {
        view.isUserInteractionEnabled = true

        if let activityIndicatorView = CustomLoader.loadIconDictionary[view] {
            UIView.defaultAnimation({
                activityIndicatorView.alpha = 0.0
            }, duration: 0.25, completionWithAnimation: true, completion: {
                activityIndicatorView.removeFromSuperview()
                activityIndicatorView.stopAnimating()
                CustomLoader.loadIconDictionary[view] = nil
            })
        }
    }
}

extension UIView {

    /// Default animation view handler
    /// - Parameters:
    ///   - success: On Successful scenario,
    ///   - duration: Duration added as 0.3 sec
    ///   - completionWithAnimation: Completion handler added for UIView to animate
    ///   - completion: It will return the completion block after 0.3 sec
    class func defaultAnimation(_ success: @escaping () -> Void,
                                duration: TimeInterval = 0.3,
                                completionWithAnimation: (Bool)? = nil, completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: {
            success()
        }) { (_) in
            guard completion != nil, let innerCompletion = completion else {
                return
            }
            guard completionWithAnimation != nil else {
                completion!()
                return
            }

            if completionWithAnimation == true {
                UIView.defaultAnimation(innerCompletion)
            } else {
                innerCompletion()
            }
        }
    }

}

//// MARK: - DEVICE DETAILS
//
///// Calculating the screen width and height
//extension DEVICE {
//
//    static let SCREENWIDTH = UIScreen.main.bounds.size.width
//    static let SCREENHEIGHT = UIScreen.main.bounds.size.height
//
//}
