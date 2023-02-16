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
    
    func getData(from url: String, callBack: @escaping ([Response]?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            var result: [Response]?
            do {
                result = try JSONDecoder().decode([Response].self, from: data)
                print(result)
                callBack(result)
//                let arrayResponse = data as? [Response]
                
            }
            catch {
                print((String(describing: error)))
            }
            guard let json = result else {
                return
            }
//            print(json.date)
//            print(json.description)
        })
        task.resume()
    }
}
