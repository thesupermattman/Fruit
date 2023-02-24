//
//  CalendarViewModel.swift
//  Fruit
//
//  Created by arthithai.aamlid on 16/2/2566 BE.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class CalendarViewModel {

    var url = "https://www.set.or.th/api/set/holiday/year/2023?lang=th"
        
    let disposeBag = DisposeBag()
    let response: BehaviorRelay<[Response]> = BehaviorRelay(value: [])
    
    func fetchData() {
       if let url = URL(string: "https://www.set.or.th/api/set/holiday/year/2023?lang=th") {
          URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
               do {
                 let response = try JSONDecoder().decode([Response].self, from: data)
                 self.response.accept(response)
               } catch let error {
                 print(error)
               }
            }
          }.resume()
       }
    }
    
    func segragation(_ sender: UISegmentedControl) -> String {
        if sender.selectedSegmentIndex == 0 {
            url = "https://www.set.or.th/api/set/holiday/year/2023?lang=th"
            return url
        } else if sender.selectedSegmentIndex == 1 { // If selectedSegementIdex == 1
            url = "https://www.set.or.th/api/set/holiday/year/2023?lang=en"
            return url
        } else {
            return ""
        }
    }
//
//    func dateConversion(date dateFromServer: String, index: Int) -> String {
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        let date = dateFormatter.date(from: dateFromServer)!
//        if index == 0 {
//            dateFormatter.locale = Locale(identifier: "th_TH")
//        }
//        dateFormatter.dateFormat = "dd-MMM-yyyy"
//        let formattedDate = dateFormatter.string(from: date)
//        return formattedDate
//    }
}

// "dd-DD-MMM-yyyy"
