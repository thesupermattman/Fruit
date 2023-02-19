//
//  CalendarViewModel.swift
//  Fruit
//
//  Created by arthithai.aamlid on 16/2/2566 BE.
//

import Foundation
import UIKit


class CalendarViewModel {

    var url = "https://www.set.or.th/api/set/holiday/year/2023?lang=th"
    
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
    
    func dateConversion(date dateFromServer: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateFromServer)!
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}

// "dd-DD-MMM-yyyy"
