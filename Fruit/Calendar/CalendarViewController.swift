//
//  CalendarViewController.swift
//  Fruit
//
//  Created by arthithai.aamlid on 16/2/2566 BE.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet weak var calendarTableView: UITableView!
    
    private var calendarViewModel = CalendarViewModel()
    
    private var calendarList: [CalendarViewModel.Response] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarTableView.dataSource = self
        calendarTableView.delegate = self
        calendarViewModel.getData(url: calendarViewModel.url, callBack: getCalendarCallback)
    }

    private func getCalendarCallback(calendarList: [CalendarViewModel.Response]?) {
//        print(calendarList)
        self.calendarList = calendarList ?? []
//        calendarTableView.reloadData()
        DispatchQueue.main.async {
            self.calendarTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // This determines how many rows there will be
        return calendarList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // This is to get that cell for each of the rows
        let cell = calendarTableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalendarTableViewCell
        
        calendarList[indexPath.row].date = calendarViewModel.dateConversion(date: calendarList[indexPath.row].date)

        cell.dateLabel.text = calendarList[indexPath.row].date
        cell.holidayDescriptionLabel.text = calendarList[indexPath.row].description
//        Date.format
        return cell
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// To do
// Fix tableview but set heightforrow at 0
// Fix the date format dd DD MM yyyy
// Fix the english/thai function
// Try to understand callback more
// Research compression priority and hugging content priority
// Research Intrinsic content size
// Research the different things in stackview such as fill, fill equally etc
