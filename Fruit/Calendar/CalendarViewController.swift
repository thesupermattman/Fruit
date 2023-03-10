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
        
//        let segmentIndex = calendarSegmentControl.selectedSegmentIndex
//        if segmentIndex == 0 {
//            let newDate = calendarViewModel.dateConversionTh(date: calendarList[indexPath.row].date)
//            cell.dateLabel.text = newDate
//        } else {
//            let newDate = calendarViewModel.dateConversionEn(date: calendarList[indexPath.row].date)
//            cell.dateLabel.text = newDate
//        }
        cell.dateLabel.text = calendarViewModel.dateConversion(date: calendarList[indexPath.row].date,
                                                               index: calendarSegmentControl.selectedSegmentIndex)
        cell.holidayDescriptionLabel.text = calendarList[indexPath.row].description
        return cell
    }
    
//    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

// To do
// Fix tableview but set heightforrow at 0 (Completed)
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
// Find the difference between merge and rebase. Try playing the game perhaps (Wednesday)
// Read Pushing, Popping, Presenting, & Dismissing ViewControllers article carefully (Wednesday)
// Read part 2 of rx and try to update it in my project (Thursday)
