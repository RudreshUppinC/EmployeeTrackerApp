//
//  DemoEmployeeVC.swift
//  SwiftEmployees
//
//  Created by DarkMoon on 01/12/22.
//

import UIKit
import FittedSheets

class DemoEmployeeVC: UIViewController {
    
    // MARK: - Public Variables

    @IBOutlet weak var bottomHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    
    
    // MARK: - ViewLifeCycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomView.isHidden = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
   
    }
    
    // MARK: - Public Functions

    
    
    // MARK: - Private Functions
    private func bottom() {
        self.bottomView.isHidden = false
        UIView.animate(withDuration: 1, delay: 0.2, options: .curveLinear, animations: {
            self.bottomView.frame = CGRect(x: 0,
                                           y: self.bottomView.frame.minY + 300  ,
                                           width: self.bottomView.frame.width,
                                           height: 300 )
            
            self.bottomView.layoutIfNeeded()
        },completion: nil)
        
    }

     private func Up() {
         self.bottomView.isHidden = false
         UIView.animate(withDuration: 1, delay: 0.2, options: .curveLinear, animations: {
                self.bottomView.frame = CGRect(x: 0,
                                               y: 0,
                                               width: self.bottomView.frame.width,
                                               height: self.view.frame.height)
                self.bottomView.layoutIfNeeded()
         },completion: nil)

     }
    

    
    // MARK: - IBAction Methods

    
    @IBAction func btnTappedHide(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.bottom()
        }
        
    }
    
    @IBAction func btnTappedUp(_ sender: UIButton) {
      
        
      //  Up()
    }
    
    

}

