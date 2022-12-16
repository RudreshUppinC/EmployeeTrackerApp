//
//  EmployeeViewModel.swift
//  SwiftNews
//
//  Created by DarkMoon on 03/11/22.
//

import Foundation

struct EmployeeViewModel {
    
    var employee = [Employee]()
    
    
    mutating func loadEmployeeData() {
        employee.append(Employee(empName: "Mr. Faraz Rahman",
                                 empImage: "Person1",
                                 empActive: "Active",
                                 empId:  1131015022,
                                 empNumber: 01670431169,
                                 empStatus: true))
        employee.append(Employee(empName: "Ms. Sayma Tasnim",
                                 empImage: "Person2", empActive: "1 day ago",
                                 empId: 1131055022,
                                 empNumber: 017150431144,
                                 empStatus: false))
        employee.append(Employee(empName: "Mr. Akib Khan",
                                 empImage: "Person3", empActive: "Active",
                                 empId: 1131015344,
                                 empNumber: 01670433355,
                                 empStatus: true))
        employee.append(Employee(empName: "Mr. Jubair Islam",
                                 empImage: "Person4", empActive: "a day ago",
                                 empId: 1131015022 ,
                                 empNumber: 01670431169,
                                 empStatus: false))
        employee.append(Employee(empName: "Mr.  Fayaz Ali",
                                 empImage: "Person5", empActive: "Active",
                                 empId: 1131015022,
                                 empNumber: 01670431169,
                                 empStatus: true))
        employee.append(Employee(empName: "Mr. Saima Islam",
                                 empImage: "Person6", empActive: "a day ago",
                                 empId: 1131015022 ,
                                 empNumber: 01670431260,
                                 empStatus: false))
        employee.append(Employee(empName: "Mr.  Salman Ali ",
                                 empImage: "Person7", empActive: "Active",
                                 empId: 1131015022,
                                 empNumber: 01670431261,
                                 empStatus: true))
        
        employee.append(Employee(empName: "Mr. Faraz Rahman",
                                 empImage: "Person1",
                                 empActive: "Active",
                                 empId:  1131015022,
                                 empNumber: 01670431169,
                                 empStatus: true))
        employee.append(Employee(empName: "Ms. Sayma Tasnim",
                                 empImage: "Person2", empActive: "1 day ago",
                                 empId: 1131055022,
                                 empNumber: 017150431144,
                                 empStatus: false))
        employee.append(Employee(empName: "Mr. Akib Khan",
                                 empImage: "Person3", empActive: "Active",
                                 empId: 1131015344,
                                 empNumber: 01670433355,
                                 empStatus: true))
        employee.append(Employee(empName: "Mr. Jubair Islam",
                                 empImage: "Person4", empActive: "a day ago",
                                 empId: 1131015022 ,
                                 empNumber: 01670431169,
                                 empStatus: false))
        employee.append(Employee(empName: "Mr.  Fayaz Ali ",
                                 empImage: "Person5", empActive: "Active",
                                 empId: 1131015022,
                                 empNumber: 01670431169,
                                 empStatus: true))
        
        employee.append(Employee(empName: "Mr. Saima Islam",
                                 empImage: "Person6", empActive: "a day ago",
                                 empId: 1131015022 ,
                                 empNumber: 01670431260,
                                 empStatus: false))
        employee.append(Employee(empName: "Mr.  Salman Ali ",
                                 empImage: "Person7", empActive: "Active",
                                 empId: 1131015022,
                                 empNumber: 01670431261,
                                 empStatus: true))
        
    }
    
}
