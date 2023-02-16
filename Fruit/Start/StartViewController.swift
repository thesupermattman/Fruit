//
//  StartViewController.swift
//  Fruit
//
//  Created by arthithai.aamlid on 15/2/2566 BE.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
    
    //var viewController = ViewController()
    
    @IBAction func ButtonFruit(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "Main") as! ViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
//        self.show(newViewController, sender: self)
    }
    
    @IBAction func ButtonCalendar(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Calendar", bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: "Calendar") as! CalendarViewController
//        self.navigationController?.pushViewController(newViewController, animated: true)
        self.show(newViewController, sender: self)
    }
}
