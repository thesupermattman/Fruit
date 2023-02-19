//
//  CalendarViewModel.swift
//  Fruit
//
//  Created by arthithai.aamlid on 16/2/2566 BE.
//

import Foundation
import UIKit


class CalendarViewModel {

    let url = "https://www.set.or.th/api/set/holiday/year/2023?lang=th"
    
    func getData(url: String, callBack: @escaping ([Response]?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: [Response]?
            do {
                result = try JSONDecoder().decode([Response].self, from: data)
                callBack(result)
            }
            catch {
                print((String(describing: error)))
            }
            guard let json = result else {
                return
            }

        })
        task.resume()
    }
    
    func dateConversion(date: String) -> String {

        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy"
        // again convert your date to string
        let myStringDate = formatter.string(from: yourDate!)

        // "dd-DD-MM-yyyy"
        // "dd-MMM-yyyy"
                
        return myStringDate
    }
}
