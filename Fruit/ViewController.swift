//
//  ViewController.swift
//  Fruit
//
//  Created by arthithai.aamlid on 13/2/2566 BE.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet weak var table: UITableView!
    
    struct Fruit {
        let title: String
        let imageName: String
    }
    
    let data: [Fruit] = [
        Fruit(title: "Apple", imageName: "1"),
        Fruit(title: "Orange", imageName: "2"),
        Fruit(title: "Banana", imageName: "3"),
        Fruit(title: "Grape", imageName: "4"),
        Fruit(title: "Lemon", imageName: "5"),
        Fruit(title: "Pear", imageName: "6")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruit = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = fruit.title
        cell.iconImageView.image = UIImage(named: fruit.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
