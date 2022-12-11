//
//  EmployeeTrackerCollectionViewCell.swift
//  SwiftNews
//
//  Created by DarkMoon on 04/11/22.
//

import UIKit

class EmpTrackerCollectionViewCell: UICollectionViewCell {
   
    // MARK: - IBOutlets
    
    @IBOutlet weak var empNamelbl: UILabel!
    @IBOutlet weak var empStatuslbl: UILabel!
    @IBOutlet weak var empImageCollection: UIImageView!
    @IBOutlet weak var empImgState: UIImageView!
    
    
    static let identifier = String(describing: EmpTrackerCollectionViewCell.self)
    
    // MARK: - Xib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Public Func
    
    func setUpCollectionCell(employee: Employee) {
         let (fname,middle) = parseName(employee.empName)
        print("firstname: \(middle), fname \(fname), \(employee.empName)")
        empNamelbl.text = middle
        empStatuslbl.text = employee.empActive
        empImageCollection.image = UIImage(named: employee.empImage)

    }
    
    // MARK: - Private Func
  
    private func parseName(_ fullName: String) -> (String, String) {
        let parsed = fullName.replacingOccurrences(of: "Ms.", with: "")

        let components = parsed.split(separator: " ", maxSplits: 3).map(String.init)
        return (components.first ?? "", components.count > 1 ? components.last! :  "")
    }
    
    
}
