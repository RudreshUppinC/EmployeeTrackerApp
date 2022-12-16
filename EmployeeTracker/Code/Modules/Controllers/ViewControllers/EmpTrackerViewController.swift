//
//  EmployeesTrackerViewController.swift
//  SwiftNews
//
//  Created by DarkMoon on 03/11/22.
//

import UIKit
import FittedSheets

class EmpTrackerViewController: UIViewController {
    
    // --------------MARK: - Public Variables ---------------
    
    // --------------MARK: - IB Outlets---------------
    
    @IBOutlet weak var bottomMainView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // --------------MARK: - ViewLife Cycle---------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSheetController()
    }
    
    // --------------MARK: - Private Functions---------------
    
    private func setUpSheetController() {
        let controller = EmplyeeTrakerSheetVC()
        
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
    
    // --------------MARK: - Public Functions---------------
    
}


class CustomTabBar: UITabBar {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 18
        layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
}

