//
//  EmployeesTrackDetailsVC.swift
//  SwiftNews
//
//  Created by DarkMoon on 03/11/22.
//

import UIKit
import FittedSheets

class EmpTrackerDetailsVC: UIViewController {
    
    // --------------MARK: - Public Variables ---------------
    
    var empName: String  = ""
    
    // --------------MARK: - IB Outlets---------------
    
    @IBOutlet weak var bottomView: UIView!
    
    // --------------MARK: - ViewLife Cycle Methods---------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = empName
        
        setUpSheetController()
    }
    
    private func setUpSheetController() {
        let controller = EmpTrackerDetailSheetVC()
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    // --------------MARK: - Private Functions---------------
    
    // --------------MARK: - Public Functions---------------
    
    // --------------MARK: - IBActions Functions---------------
    
    @IBAction func buttonTapAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            let myViewController = DemoEmployeeVC(nibName: "DemoEmployeeVC", bundle: nil)
            //self.present(myViewController, animated: true)
            self.navigationController?.pushViewController(myViewController, animated: true)
        }
        
    }
    
    
}
