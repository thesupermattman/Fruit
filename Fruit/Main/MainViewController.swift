//
//  ViewController.swift
//  Fruit
//
//  Created by arthithai.aamlid on 13/2/2566 BE.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var viewModel = ViewModel()
    private let bag = DisposeBag()
    var fruitWebView = FruitWebViewViewController()
    var fruit: [ViewModel.Fruit] = []
            
    @IBOutlet weak var table: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        table.rx.setDelegate(self).disposed(by: bag)
        table.delegate = self
        table.dataSource = self
        observeObservable()
    }
    
    private func observeObservable() {
//        table.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
//        viewModel.items.bind(to: table.rx.items(cellIdentifier: "cell", cellType: CustomTableViewCell.self)) { (row,item,cell) in
//            cell.label?.text = title
//            cell.iconImageView?.image = UIImage(named: viewModel.imageName)
//        }.disposed(by: bag)
//
//        table.rx.modelSelected(Fruit.self).subscribe(onNext: { item in
//            print()
//        }).disposed(by: bag)
//
        viewModel.itemBehaviorSubject.subscribe(onNext: { fruitList in
            self.fruit = fruitList
            self.table.reloadData()
        })
    }
}

//extension ViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//
//}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruit = self.fruit[indexPath.row]
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
        let url = self.fruit[indexPath.row].url

        let storyBoard: UIStoryboard = UIStoryboard(name: "FruitWebView", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "FruitWebView") as! FruitWebViewViewController
        newViewController.urlString = url
        self.navigationController?.pushViewController(newViewController, animated: true)

        print("Index path row = " + String(indexPath.row))
    }
}
