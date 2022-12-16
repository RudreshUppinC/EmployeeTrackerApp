//
//  EmplyeeStatusTrakerVC.swift
//  EmployeeTraker
//
//  Created by DarkMoon on 11/12/22.
//

import UIKit
import FittedSheets

class EmplyeeTrakerSheetVC: UIViewController {
    // --------------MARK: - Public Variables ---------------
    
    var viewModel = EmployeeViewModel()
    
    // --------------MARK: - IB Outlets---------------
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // --------------MARK: - IB Actions---------------
    
    // --------------MARK: - ViewLife Cycle ---------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
    }
    
    // --------------MARK: - Public Functions---------------
    
    // --------------MARK: - Private Functions---------------
    
    private func setViews() {
         registorCells()
        
    }
    
    private func registorCells() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: EmpTrackerCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: EmpTrackerCollectionViewCell.identifier)
        viewModel.loadEmployeeData()
        
    }
    
    
}

extension EmplyeeTrakerSheetVC:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.employee.count - 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                EmpTrackerCollectionViewCell.identifier,for: indexPath) as? EmpTrackerCollectionViewCell
        else { return UICollectionViewCell() }
        cell.setUpCollectionCell(employee: viewModel.employee[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  40
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize, height: 72)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let empDetailVC = storyboard.instantiateViewController(withIdentifier: "EmpTrackerDetailsVC") as? EmpTrackerDetailsVC else { fatalError("Unable to instance")  }
        empDetailVC.empName =  viewModel.employee[indexPath.row].empName
        self.navigationController?.pushViewController(empDetailVC, animated: true)
        
    }
    
}
