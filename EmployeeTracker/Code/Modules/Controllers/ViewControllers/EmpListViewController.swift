//
//  ViewController.swift
//  SwiftNews
//
//  Created by DarkMoon on 02/11/22.
//

import UIKit
import NVActivityIndicatorView

class EmpListViewController: UIViewController {
    
    // --------------MARK: - Public Variables ---------------
    
    var viewModel = EmployeeViewModel()
    var filteredList: [Employee] = []
    private var loaderView = UIView()
    
    // --------------MARK: - IB Outlets---------------
    
    @IBOutlet weak var filterImage: UIImageView!
    @IBOutlet weak var searchTextBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // --------------MARK: - ViewLife Cycle---------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registorCells()
        searchTextBar.delegate = self
        searchTextBar.setImage(UIImage(named: "Search"), for: .search, state: .normal)
        setupUiView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    // MARK: - Private Functions
    
    private func registorCells() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: EmployeeTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: EmployeeTableViewCell.identifier)
        viewModel.loadEmployeeData()
        
        
        filteredList = viewModel.employee
    }
    
    private func setupUiView() {
        let filterTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        filterImage.isUserInteractionEnabled = true
        filterImage.addGestureRecognizer(filterTap)
        
        
        loaderView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        loaderView.center = view.center
        self.view.addSubview(loaderView)
        
   
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        filterImage.alpha = 0.5
        UIView.animate(withDuration: 0.5){
            self.filterImage.alpha = 1.0
        }
        
    }
    
    
}

extension EmpListViewController : UISearchBarDelegate {
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        // if searchText != "" {
        
        filteredList  = viewModel.employee.filter { name in
            return  name.empName.lowercased().contains(searchText.lowercased())
        }
        
        //        if filteredList.isEmpty {
        loaderView.activityStartAnimating()
        //        }
        
        
        filteredList = []
        
        if filteredList.isEmpty {
            loaderView.activityStopAnimating()
        }
        
        
        tableView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText: searchBar.text!)
        
    }
    
}


// MARK: - Extension ViewController

extension EmpListViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in
            // Perform your action here
            completion(true)
        }
        
        deleteAction.image = UIImage(named: "Delete")
        deleteAction.backgroundColor = UIColor.white
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifier, for: indexPath) as! EmployeeTableViewCell
        cell.configureCell(employee: filteredList[indexPath.row], indexPath: indexPath.row)
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    
}





extension UIView{
    
    func activityStartAnimating() {
        
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        
        var activityIndicator = NVActivityIndicatorView(frame: CGRect(
            x: 0,
            y: 0,
            width: 40,
            height: 40),type: .circleStrokeSpin, color: UIColor.red)
        activityIndicator.startAnimating()
        
        // backgroundView.addSubview(activityIndicator)
        
        self.addSubview(activityIndicator)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}


