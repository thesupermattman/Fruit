//
//  Model.swift
//  Fruit
//
//  Created by arthithai.aamlid on 16/2/2566 BE.
//

import Foundation

extension CalendarViewModel {
    
    struct Response: Codable {
        var date: String
        let description: String
    }
    
    struct Hello {
        let formattedDate: Date
    }
}
