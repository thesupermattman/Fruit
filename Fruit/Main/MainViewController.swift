//
//  ViewController.swift
//  Fruit
//
//  Created by arthithai.aamlid on 13/2/2566 BE.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = ViewModel()
    var fruitWebView = FruitWebViewViewController()
    
    var goodbye = "Goodbye"
    var greeting = "Hello"
        
    @IBOutlet weak var table: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruit = viewModel.getData(for: indexPath)
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = fruit.title
        cell.iconImageView.image = UIImage(named: fruit.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = viewModel.getFruitUrl(for: indexPath)
                
        let storyBoard: UIStoryboard = UIStoryboard(name: "FruitWebView", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "FruitWebView") as! FruitWebViewViewController
        newViewController.urlString = url
        self.navigationController?.pushViewController(newViewController, animated: true)

        print("Index path row = " + String(indexPath.row))
    }
}
