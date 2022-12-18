//
//  EmployeeTableViewCell.swift
//  SwiftNews
//
//  Created by DarkMoon on 03/11/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var empNamelbl: UILabel!
    @IBOutlet weak var empIDlbl: UILabel!
    @IBOutlet weak var empNumberlbl: UILabel!
    @IBOutlet weak var empStatuslbl: UILabel!
    @IBOutlet weak var empImage: UIImageView!
    
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var trackImage: UIImageView!
    static let identifier = String(describing: EmployeeTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpMainContentView()
        
    }
    
    // MARK: - Private Func
     private func setUpMainContentView() {
         mainContentView.layer.cornerRadius = 10
         mainContentView.layer.borderColor = UIColor.black.cgColor
         mainContentView.layer.masksToBounds = true
         
     }
    
    // MARK: - Public Func

    func configureCell(employee: Employee, indexPath: Int) {
        
        empNamelbl.text =  "Name: \(employee.empName)"
        empIDlbl.text = "Employee ID: \(employee.empId)"
        empNumberlbl.text = "Contact: \(employee.empNumber)"
        empImage.image = UIImage(named: employee.empImage)
   
        if !employee.empStatus{
            empStatuslbl.textColor = MyColor.InActiveStatus.value
            empStatuslbl.text = "Status: InActive"
            
        } else {
            empStatuslbl.text = "Status: Active"
            empStatuslbl.textColor = MyColor.ActiveStatus.value

        }
    }
   
    
}
