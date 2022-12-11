//
//  EmployeesTrackDetailsVC.swift
//  SwiftNews
//
//  Created by DarkMoon on 03/11/22.
//

import UIKit

class EmpTrackDetailsVC: UIViewController {

    var empName: String  = ""

    @IBAction func buttonTapAction(_ sender: UIButton) {
        DispatchQueue.main.async {

        let myViewController = DemoEmployeeVC(nibName: "DemoEmployeeVC", bundle: nil)
            //self.present(myViewController, animated: true)
            self.navigationController?.pushViewController(myViewController, animated: true)
        }

    }
        
    @IBOutlet weak var bottomView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = empName
    }
    
  
  
    override func viewDidAppear(_ animated: Bool) {

    }

}
