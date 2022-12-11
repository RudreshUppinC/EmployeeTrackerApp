//
//  EmployeesTrackerViewController.swift
//  SwiftNews
//
//  Created by DarkMoon on 03/11/22.
//

import UIKit
import FittedSheets

class EmpTrackerViewController: UIViewController {
    
    @IBOutlet weak var bottomMainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSheetController()
    }
    
    private func setUpSheetController() {
        let controller = EmplyeeStatusTrakerVC()
        
        let sheetController =
        SheetViewController(
            controller: controller,
            sizes: [.percent(0.30), . percent(65.0)])
        sheetController.overlayColor = .clear
        sheetController.allowGestureThroughOverlay = true
        sheetController.animateIn(to: view, in: self)
        sheetController.cornerRadius = 25
        sheetController.dismissOnPull = false
        
    }
    
}


class CustomTabBar: UITabBar {
        
     override func awakeFromNib() {
            super.awakeFromNib()
            layer.masksToBounds = true
            layer.cornerRadius = 18
            layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
      }
 }

