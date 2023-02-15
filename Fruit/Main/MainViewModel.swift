//
//  ViewModel.swift
//  Fruit
//
//  Created by arthithai.aamlid on 14/2/2566 BE.
//

import Foundation

class ViewModel {
    
    private let data: [Fruit] = [
        Fruit(title: "Apple", imageName: "1", url: "https://en.wikipedia.org/wiki/Apple"),
        Fruit(title: "Orange", imageName: "2", url: "https://en.wikipedia.org/wiki/Orange"),
        Fruit(title: "Banana", imageName: "3", url: "https://en.wikipedia.org/wiki/Banana"),
        Fruit(title: "Grape", imageName: "4", url: "https://en.wikipedia.org/wiki/Grape"),
        Fruit(title: "Lemon", imageName: "5", url: "https://en.wikipedia.org/wiki/Lemon"),
        Fruit(title: "Pear", imageName: "6", url: "https://en.wikipedia.org/wiki/Pear")
    ]
    
    func getData(for indexPath: IndexPath) -> Fruit {
        return data[indexPath.row]
    }
    
    func getDataCount() -> Int {
        return data.count
    }
    
    func getFruitUrl(for indexPath: IndexPath) -> String {
        return data[indexPath.row].url
    }
}
