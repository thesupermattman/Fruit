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
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
//            calendarViewModel.url = "https://www.set.or.th/api/set/holiday/year/2023?lang=th"
            calendarViewModel.getData(url: "https://www.set.or.th/api/set/holiday/year/2023?lang=th", callBack: getCalendarCallback)
        } else if sender.selectedSegmentIndex == 1 { // If selectedSegementIdex == 1
//            calendarViewModel.url = "https://www.set.or.th/api/set/holiday/year/2023?lang=en"
            calendarViewModel.getData(url: "https://www.set.or.th/api/set/holiday/year/2023?lang=en", callBack: getCalendarCallback)
        }
//        calendarViewModel.getData(index: sender.selectedSegmentIndex, callBack: get)
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
        
        let newDate = calendarViewModel.dateConversionTh(date: calendarList[indexPath.row].date)

        cell.dateLabel.text = newDate
        cell.holidayDescriptionLabel.text = calendarList[indexPath.row].description
        return cell
    }
    
//    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

// To do
// Fix tableview but set heightforrow at 0 (Partially complete)
// Fix the date format dd DD MM yyyy (Completed)
// Fix the english/thai function (Completed)

// Research compression priority and hugging content priority (Completed)
    //Hugging => content does not want to grow
    //Compression Resistance => content does not want to shrink
    // The content hugging priority determines how eager a view is to grow beyond its intrinsic content size.
    // The content compression resistance priority determine how easy it is to compress the label if it needs to shrink.

// Research Intrinsic content size (Completed)
    // Intrinsic content size is when the UI object you're using knows what size it is. For example, you want the size of the a label to change depending on its contents, that is, the text it is displaying.

// Research the different things in stackview such as fill, fill equally etc
// Try to understand callback more

// To Do
// Fix didChangeSegment by putting a lot of it in the CalendarViewModel
// Change the Thai date format to Thai language
// Research what is deeplink
// Read the rx files
