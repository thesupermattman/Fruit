//
//  CalendarViewController.swift
//  Fruit
//
//  Created by arthithai.aamlid on 16/2/2566 BE.
//

import UIKit
import RxSwift
import RxCocoa

class CalendarViewController: UIViewController, UITableViewDelegate {
        
    @IBOutlet weak var calendarTableView: UITableView!
    
    private var calendarViewModel = CalendarViewModel()
    
    private var calendarList: [CalendarViewModel.Response] = []
        
    @IBOutlet weak var calendarSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarTableView.dataSource = self
        calendarTableView.delegate = self
        calendarViewModel.getData(url: calendarViewModel.url, callBack: getCalendarCallback)
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        calendarViewModel.getData(url: calendarViewModel.segragation(sender), callBack: getCalendarCallback)
    }
    

    private func getCalendarCallback(calendarList: [CalendarViewModel.Response]?) {
        self.calendarList = calendarList ?? []
        DispatchQueue.main.async {
            self.calendarTableView.reloadData()
        }
    }
    
//    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

extension CalendarViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // This determines how many rows there will be
        
        return calendarList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // This is to get that cell for each of the rows
        
        let cell = calendarTableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalendarTableViewCell

        cell.dateLabel.text = calendarViewModel.dateConversion(date: calendarList[indexPath.row].date,
                                                               index: calendarSegmentControl.selectedSegmentIndex)
        
        cell.holidayDescriptionLabel.text = calendarList[indexPath.row].description
        return cell
    }
}
