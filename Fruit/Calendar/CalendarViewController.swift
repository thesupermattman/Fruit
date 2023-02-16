//
//  CalendarViewController.swift
//  Fruit
//
//  Created by arthithai.aamlid on 16/2/2566 BE.
//

import UIKit

class CalendarViewController: UIViewController { //, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet weak var calendarTableView: UITableView!
    
    private var calendarViewModel = CalendarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        calendarTableView.dataSource = self
//        calendarTableView.delegate = self
        calendarViewModel.getData(from: calendarViewModel.url, callBack: getCalendarCallback)
    }
    
    private func getCalendarCallback(calendarList: [CalendarViewModel.Response]?) {
        print(calendarList)
        
    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
}
