//
//  ViewModel.swift
//  Fruit
//
//  Created by arthithai.aamlid on 14/2/2566 BE.
//

import Foundation
import RxSwift
import RxCocoa

class ViewModel {
    
    let fruit = [
        Fruit(title: "Apple", imageName: "1", url: "https://en.wikipedia.org/wiki/Apple"),
        Fruit(title: "Orange", imageName: "2", url: "https://en.wikipedia.org/wiki/Orange"),
        Fruit(title: "Banana", imageName: "3", url: "https://en.wikipedia.org/wiki/Banana"),
        Fruit(title: "Grape", imageName: "4", url: "https://en.wikipedia.org/wiki/Grape"),
        Fruit(title: "Lemon", imageName: "5", url: "https://en.wikipedia.org/wiki/Lemon"),
        Fruit(title: "Pear", imageName: "6", url: "https://en.wikipedia.org/wiki/Pear")
    ]
    
    var itemObservable = PublishSubject<[Fruit]>()
    var itemBehaviorSubject = BehaviorSubject<[Fruit]>(value: [
        Fruit(title: "Apple", imageName: "1", url: "https://en.wikipedia.org/wiki/Apple"),
        Fruit(title: "Orange", imageName: "2", url: "https://en.wikipedia.org/wiki/Orange"),
        Fruit(title: "Banana", imageName: "3", url: "https://en.wikipedia.org/wiki/Banana"),
        Fruit(title: "Grape", imageName: "4", url: "https://en.wikipedia.org/wiki/Grape"),
        Fruit(title: "Lemon", imageName: "5", url: "https://en.wikipedia.org/wiki/Lemon"),
        Fruit(title: "Pear", imageName: "6", url: "https://en.wikipedia.org/wiki/Pear")
    ])
    
    func fetchItems() {
        
        itemObservable.onNext(fruit)
        //itemObservable.onCompleted()
    }
//
//        func getData(for indexPath: IndexPath) -> Fruit {
//        return fetchItems()
//    }
//
//    func getDataCount() -> Int {
//        return data.count
//    }
//
//    func getFruitUrl(for indexPath: IndexPath) -> String {
//        return data[indexPath.row].url
//    }
}

// Find out difference between publishSubject and behaviorSubject
// Read about generic types for swift
